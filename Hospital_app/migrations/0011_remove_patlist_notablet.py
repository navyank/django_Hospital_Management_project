# Generated by Django 3.2.17 on 2023-03-21 05:11

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Hospital_app', '0010_patlist'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='patlist',
            name='NoTablet',
        ),
    ]
