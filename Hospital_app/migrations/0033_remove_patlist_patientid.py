# Generated by Django 3.2.17 on 2023-03-21 12:10

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Hospital_app', '0032_remove_patlist_doctorid'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='patlist',
            name='patientid',
        ),
    ]
