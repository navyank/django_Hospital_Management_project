# Generated by Django 3.2.17 on 2023-03-20 15:47

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Hospital_app', '0002_remove_test_nurseid'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='todaypatlist',
            name='symtoms',
        ),
    ]
