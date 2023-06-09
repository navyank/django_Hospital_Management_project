# Generated by Django 3.2.17 on 2023-03-20 16:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Hospital_app', '0003_remove_todaypatlist_symtoms'),
    ]

    operations = [
        migrations.CreateModel(
            name='patlist',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('patName', models.CharField(max_length=50)),
                ('dob', models.DateField()),
                ('gender', models.CharField(max_length=50)),
                ('blood_gp', models.CharField(max_length=50)),
                ('testName', models.CharField(max_length=50)),
                ('medicine_names', models.CharField(max_length=50)),
                ('medicine_dosage', models.CharField(max_length=50)),
                ('NoTablet', models.CharField(max_length=50)),
                ('issueDate', models.DateField()),
                ('expDate', models.DateField()),
                ('Status', models.CharField(max_length=50)),
                ('patientid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Hospital_app.patient')),
            ],
        ),
    ]
