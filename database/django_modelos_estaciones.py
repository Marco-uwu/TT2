# Estos son los modelos generados para trabajar en Django con la BD ya existente en MySQL

from django.db import models


class Estaciones(models.Model):
    id_regla = models.ForeignKey('ReglasMedicion', models.DO_NOTHING, db_column='id_regla')
    nombre = models.CharField(max_length=100, blank=True, null=True)
    ubicacion = models.CharField(max_length=255, blank=True, null=True)
    estado = models.CharField(max_length=17)
    dir_mac = models.CharField(unique=True, max_length=16)

    class Meta:
        managed = False
        db_table = 'estaciones'


class Mediciones(models.Model):
    valor = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    fecha = models.DateTimeField()
    id_estacion = models.ForeignKey(Estaciones, models.DO_NOTHING, db_column='id_estacion', blank=True, null=True)
    id_tipo_medicion = models.ForeignKey('TiposMedicion', models.DO_NOTHING, db_column='id_tipo_medicion', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'mediciones'


class ParametrosMedicion(models.Model):
    id_regla = models.ForeignKey('ReglasMedicion', models.DO_NOTHING, db_column='id_regla')
    id_tipo_medicion = models.ForeignKey('TiposMedicion', models.DO_NOTHING, db_column='id_tipo_medicion')
    valor_min = models.DecimalField(max_digits=5, decimal_places=2)
    valor_ide = models.DecimalField(max_digits=5, decimal_places=2)
    valor_max = models.DecimalField(max_digits=5, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'parametros_medicion'
        unique_together = (('id_regla', 'id_tipo_medicion'),)


class ReglasMedicion(models.Model):
    nombre = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'reglas_medicion'


class TiposMedicion(models.Model):
    descripcion = models.CharField(unique=True, max_length=50)
    tipo_medicion = models.CharField(max_length=3)

    class Meta:
        managed = False
        db_table = 'tipos_medicion'
