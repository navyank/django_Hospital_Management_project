from django.db import models

# Create your models here.
class login(models.Model):
    username=models.CharField(max_length=50)
    password=models.CharField(max_length=50)
    type=models.CharField(max_length=50)

# class departments(models.Model):
#     deptpartment_name= models.CharField(max_length=50)
class doctor(models.Model):
    lid = models.ForeignKey(login, on_delete=models.CASCADE)
    Fname=models.CharField(max_length=50)
    Lname=models.CharField(max_length=50)
    qualification=models.CharField(max_length=50)
    deptName_id=models.CharField(max_length=50)
    contact_no=models.BigIntegerField()
    email_id=models.CharField(max_length=50)
    place = models.CharField(max_length=50)
    post_office = models.CharField(max_length=50)
    pin_code = models.IntegerField()
    dob=models.DateField()
    gender=models.CharField(max_length=50)
class patient(models.Model):
    # token_number = models.IntegerField()
    # lid=models.ForeignKey(login,on_delete=models.CASCADE)
    Fname=models.CharField(max_length=50)
    date = models.DateField()
    Lname=models.CharField(max_length=50)
    place=models.CharField(max_length=50)
    post_office=models.CharField(max_length=50)
    pin_code=models.IntegerField()
    phone_number=models.BigIntegerField()
    gender=models.CharField(max_length=50)
    dob=models.DateField()
    email_id=models.CharField(max_length=50)
    blood_gp=models.CharField(max_length=50)
    # symtoms = models.CharField(max_length=50)
class pharm(models.Model):
    lid = models.ForeignKey(login, on_delete=models.CASCADE)
    Fname=models.CharField(max_length=50)
    Lname=models.CharField(max_length=50)
    place=models.CharField(max_length=50)
    post_office=models.CharField(max_length=50)
    pin_code=models.IntegerField()
    phone_number=models.BigIntegerField()
    gender=models.CharField(max_length=50)
    dob=models.DateField()
    email_id=models.CharField(max_length=50)
class medicines(models.Model):
    pharmasistid = models.ForeignKey(pharm, on_delete=models.CASCADE)
    doctorid=models.ForeignKey(doctor,on_delete=models.CASCADE)
    patientid=models.ForeignKey(patient,on_delete=models.CASCADE)
    medicine= models.CharField(max_length=50)
    medicine_dosage= models.CharField(max_length=50)
    bill_amount= models.CharField(max_length=50)
class med(models.Model):
    medicine_names=models.CharField(max_length=50)
class receptionist(models.Model):
    lid = models.ForeignKey(login, on_delete=models.CASCADE)
    Fname=models.CharField(max_length=50)
    Lname=models.CharField(max_length=50)
    place=models.CharField(max_length=50)
    post_office=models.CharField(max_length=50)
    pin_code=models.IntegerField()
    phone_number=models.BigIntegerField()
    gender=models.CharField(max_length=50)
    dob=models.DateField()
    email_id=models.CharField(max_length=50)
#
class booking(models.Model):
        # receptionistid = models.ForeignKey(receptionist, on_delete=models.CASCADE)
        doctorid = models.ForeignKey(doctor, on_delete=models.CASCADE)
        patientid = models.ForeignKey(patient, on_delete=models.CASCADE)
        reg_date = models.DateField()
        reg_time = models.TimeField()
        token_number = models.IntegerField()

class nurse(models.Model):
    lid = models.ForeignKey(login, on_delete=models.CASCADE)
    Fname=models.CharField(max_length=50)
    Lname=models.CharField(max_length=50)
    deptName=models.CharField(max_length=50)
    contact_no=models.BigIntegerField()
    email_id=models.CharField(max_length=50)
    place = models.CharField(max_length=50)
    post_office = models.CharField(max_length=50)
    pin_code = models.IntegerField()
    dob=models.DateField()
    gender=models.CharField(max_length=50)
class mystatus(models.Model):
    doctorid = models.ForeignKey(doctor, on_delete=models.CASCADE)
    leave_on=models.CharField(max_length=50)
    not_available_at=models.TimeField()
    op_time=models.TimeField()
    no_patient_fornoon=models.IntegerField()
    no_patient_afternoon=models.IntegerField()
class test(models.Model):
    # nurseid = models.ForeignKey(nurse, on_delete=models.CASCADE)
    testName=models.CharField(max_length=50)


class pattlist(models.Model):
    Medcine_dosage=models.CharField(max_length=50)
    NoTablet = models.CharField(max_length=50)
    issueDate = models.DateField()
    expDate = models.DateField()
#
