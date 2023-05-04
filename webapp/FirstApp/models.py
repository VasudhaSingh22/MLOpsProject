from django.db import models

# Create your models here.
class airfoil_exp(models.Model):
    f = models.FloatField()
    alpha = models.FloatField()
    c = models.FloatField()
    U_infinity = models.FloatField()
    delta = models.FloatField()
    SSPL = models.FloatField()