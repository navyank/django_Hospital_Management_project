# Generated by Django 3.2.17 on 2023-03-21 12:08

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Hospital_app', '0031_delete_todaypatlist'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='patlist',
            name='doctorid',
        ),
    ]