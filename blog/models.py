# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import AbstractUser

# class Post(models.Model):
#     author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
#     title = models.CharField(max_length=200)
#     text = models.TextField()
#     created_date = models.DateTimeField(
#             default=timezone.now)
#     published_date = models.DateTimeField(
#             blank=True, null=True)

#     def publish(self):
#         self.published_date = timezone.now()
#         self.save()

#     def __str__(self):
#         return self.title


class FormAll(models.Model):
    date_ordered = models.DateField(blank=True, null=True)
    address = models.CharField(max_length=200, blank=True, null=True)
    ordered_from = models.CharField(max_length=200, blank=True, null=True)
    ordered_by = models.CharField(max_length=200, blank=True, null=True)
    date_deliveredby = models.DateField(blank=True, null=True)
    file_no = models.CharField(max_length=50, blank=True, null=True)
    project_no = models.CharField(max_length=200, blank=True, null=True)
    date_pd = models.DateField(blank=True, null=True)
    date_due = models.CharField(max_length=50, blank=True, null=True)
    surveyor = models.CharField(max_length=50, blank=True, null=True)
    field_crew = models.CharField(max_length=200, blank=True, null=True)
    cancelled = models.CharField(max_length=50, blank=True, null=True)
    aka = models.CharField(max_length=255, blank=True, null=True)
    user_id = models.IntegerField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    fee = models.DecimalField(max_digits=9, decimal_places=2, null=True)
    # delete_later = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        db_table = 'gdi'
    # def publish(self):
    #     self.published_date = timezone.now()
    #     self.save()

    # def __str__(self):
    #     return self.project_no


class Users(AbstractUser):
    # email = models.CharField(max_length=255, blank=True, null=True)
    # password = models.CharField(max_length=255, blank=True, null=True)
    remember_token = models.CharField(max_length=100, blank=True, null=True)
    role_id = models.IntegerField(blank=True, null=True)
    edit_auth = models.BooleanField(default=False)

    def save(self, *args, **kwargs):
        super(Users, self).save(*args, **kwargs)
