from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.models import User  # Asegúrate de importar el modelo correcto
from .models import UserProfile  # Importa tu modelo de perfil

@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        UserProfile.objects.create(user=instance)

