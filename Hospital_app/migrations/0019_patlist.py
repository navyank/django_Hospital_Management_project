# Generated by Django 3.2.17 on 2023-03-21 05:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Hospital_app', '0018_delete_patlist'),
    ]

    operations = [
        migrations.CreateModel(
            name='patlist',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('testName', models.CharField(max_length=50)),
                ('medicine_names', models.CharField(max_length=50)),
                ('medicine_dosage', models.CharField(max_length=50)),
                ('doctorid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Hospital_app.doctor')),
                ('patientid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Hospital_app.patient')),
            ],
        ),
    ]