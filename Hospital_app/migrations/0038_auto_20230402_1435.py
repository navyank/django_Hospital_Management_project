# Generated by Django 3.2.17 on 2023-04-02 09:05

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Hospital_app', '0037_patlist'),
    ]

    operations = [
        migrations.RenameField(
            model_name='patlist',
            old_name='medicine_dosage',
            new_name='Medcine_dosage',
        ),
        migrations.RemoveField(
            model_name='patlist',
            name='doctorid',
        ),
        migrations.RemoveField(
            model_name='patlist',
            name='medicine_names',
        ),
        migrations.RemoveField(
            model_name='patlist',
            name='nurseid',
        ),
        migrations.RemoveField(
            model_name='patlist',
            name='patientid',
        ),
        migrations.RemoveField(
            model_name='patlist',
            name='pharmid',
        ),
        migrations.RemoveField(
            model_name='patlist',
            name='testName',
        ),
    ]
