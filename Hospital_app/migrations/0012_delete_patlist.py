# Generated by Django 3.2.17 on 2023-03-21 05:15

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Hospital_app', '0011_remove_patlist_notablet'),
    ]

    operations = [
        migrations.DeleteModel(
            name='patlist',
        ),
    ]