# Generated by Django 3.2.17 on 2023-03-21 05:55

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Hospital_app', '0020_remove_patlist_doctorid'),
    ]

    operations = [
        migrations.DeleteModel(
            name='patlist',
        ),
    ]
