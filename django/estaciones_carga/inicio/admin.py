from django.contrib import admin
from django import forms
from django.contrib.auth.models import User
from .models import UserProfile
from django.contrib.auth.forms import UserCreationForm, UserChangeForm

class UserProfileForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['user_type']

class CustomUserCreationForm(UserCreationForm):
    user_type = forms.ChoiceField(choices=UserProfile.USER_TYPES, required=False, initial='client')  # Añadir el campo user_type

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2', 'user_type']  # Incluir user_type

class CustomUserChangeForm(UserChangeForm):
    class Meta:
        model = User
        fields = ['username', 'email', 'first_name', 'last_name', 'is_staff', 'is_superuser', 'groups', 'user_permissions']

class UserAdmin(admin.ModelAdmin):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    model = User

    def save_model(self, request, obj, form, change):
        super().save_model(request, obj, form, change)
        if not hasattr(obj, 'profile'):
            user_type = form.cleaned_data.get('user_type', 'client')  # Usa el valor por defecto si no se proporciona uno
            UserProfile.objects.create(user=obj, user_type=user_type)
        else:
            obj.profile.user_type = form.cleaned_data['user_type']
            obj.profile.save()

    def get_form(self, request, obj=None, **kwargs):
        if obj is None:
            self.form = self.add_form
        else:
            self.form = CustomUserChangeForm
        return super().get_form(request, obj, **kwargs)

    list_display = ('username', 'email', 'first_name', 'last_name', 'is_staff', 'profile')

admin.site.unregister(User)
admin.site.register(User, UserAdmin)

@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('user', 'user_type')
