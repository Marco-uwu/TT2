# Generated by Django 4.2.16 on 2024-10-31 07:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('inicio', '0003_alter_estacion_table_alter_medicion_table'),
    ]

    operations = [
        migrations.AlterField(
            model_name='estacion',
            name='nombre',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='estacion',
            name='ubicacion',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='medicion',
            name='estacion',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='inicio.estacion'),
        ),
        migrations.AlterField(
            model_name='medicion',
            name='intensidad_1',
            field=models.FloatField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='medicion',
            name='intensidad_2',
            field=models.FloatField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='medicion',
            name='temperatura',
            field=models.FloatField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='medicion',
            name='voltaje_1',
            field=models.FloatField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='medicion',
            name='voltaje_2',
            field=models.FloatField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='medicion',
            name='voltaje_3',
            field=models.FloatField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='medicion',
            name='voltaje_4',
            field=models.FloatField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='medicion',
            name='voltaje_5',
            field=models.FloatField(blank=True, null=True),
        ),
    ]
