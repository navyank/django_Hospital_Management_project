# Generated by Django 3.2.17 on 2023-03-21 10:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Hospital_app', '0026_delete_patlist'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='todaypatlist',
            name='doctorid',
        ),
        migrations.RemoveField(
            model_name='todaypatlist',
            name='token_number',
        ),
    ]
