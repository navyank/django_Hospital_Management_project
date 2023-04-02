from django.shortcuts import render
from django.http import HttpResponse
from datetime import datetime
from .models import login,patient,doctor,nurse,medicines,pharm,booking,receptionist,mystatus,test,med,pattlist

# Create your views here.
def main(request):
    return render(request,"login.html")
def loginn(request):
    uname=request.POST['textfield']
    pwd=request.POST['textfield2']
    try:
        ob=login.objects.get(username=uname,password=pwd)
        if ob.type=="nurse":
            request.session['lid']=ob.id
            return HttpResponse("<script>alert('ok');window.location='/nursehome'</script>")
        elif ob.type=="doctor":
            request.session['lid'] = ob.id
            return HttpResponse("<script>alert('ok');window.location='/Dochome'</script>")
        elif ob.type=="pharmasist":
            request.session['lid'] = ob.id
            return HttpResponse("<script>alert('ok');window.location='/pharmhome'</script>")
        elif ob.type=="receptionist":
            request.session['lid'] = ob.id
            return HttpResponse("<script>alert('ok');window.location='/Receptionisthome'</script>")
        elif ob.type=="admin":
            request.session['lid'] = ob.id
            return HttpResponse("<script>alert('ok');window.location='/Adminhomes'</script>")
        else:
            return HttpResponse("<script>alert('Invalid username or password');window.location='/'</script>")

    except:
        return HttpResponse("<script>alert('Invalid username or password');window.location='/'</script>")

    return render(request,"login.html")
def Dochome(request):
    return render(request,"dochome.html")
def Adminhomes(request):
    return render(request,"Adminhomes.html")
def nursehome(request):
    return render(request,"nursehome.html")
def pharmhome(request):
    return render(request,"pharmhome.html") 
def Receptionisthome(request):
    return render(request,"Receptionisthome.html")  
def todayPatList(request):
    ob1=patient.objects.all()
    ob=booking.objects.filter(doctorid__lid__id=request.session['lid']).order_by('-id')
    print(ob, "++++++++")
    # ob2=patlist.objects.all()
    return render(request,"today pat.html",{"val": ob})
def insertpatList(request):
    Medcine_dosage=request.POST['select3']
    NoTablet=request.POST['select32']
    issueDate=request.POST['textfield13']
    expDate=request.POST['textfield3']
    ob4=pattlist()
    ob4.Medcine_dosage = Medcine_dosage
    ob4.NoTablet=NoTablet
    ob4.issueDate = issueDate
    ob4.expDate = expDate
    ob4.save()
    return HttpResponse("<script>alert('Inserted successfully');window.location='/todayPatList#faq'</script>")
def myStatusD(request):
    ob = mystatus.objects.all()
    ob1 = doctor.objects.all()
    return render(request,"My status.html",{"val":ob,'var':ob1})
def insertmyStatus(request):
    leave=request.POST['leave']
    not_available_at=request.POST['time1']
    op_time=request.POST['time2']
    no_check_fornoon=request.POST['fornoon']
    no_check_afternoon=request.POST['afternoon']
    docid = request.POST['docid']

    ob1 = mystatus()
    obd = doctor.objects.get(id=docid)
    ob1.doctorid = obd
    ob1.leave_on=leave
    ob1.not_available_at = not_available_at
    ob1.op_time = op_time
    ob1.no_patient_fornoon = no_check_fornoon


    ob1.no_patient_afternoon = no_check_afternoon

    ob1.save()

    return HttpResponse("<script>alert('Inserted successfully');window.location='/myStatusD#faq'</script>")
def nurseTodayWork(request):
    return render(request,"nurse.html")  
def availableTest(request):
    ob = test.objects.all()

    return render(request,"Available Test.html", {"val": ob})
def pharmTodayWork(request):

    return render(request,"pharm.html")
def availableMedicine(request):
    ob=med.objects.all()
    return render(request,"available medicine.html",{"val": ob})
def addMedicines(request):
    medicine_names = request.POST['textfield']
    ob1=med()
    ob1.medicine_names = medicine_names
    ob1.save()
    return HttpResponse("<script>alert('Inserted successfully');window.location='/availableMedicine#faq'</script>")
def patientRegistration(request):
    ob = patient.objects.all()
    return render(request,"reg form pat.html", {"val": ob})
def insertregpat(request):
    Fname = request.POST['txtname']
    Lname = request.POST['lstname']
    place = request.POST['txtplace']
    post_office = request.POST['txtPO']
    pin_code = request.POST['txtpin']
    phone_number = request.POST['txtphno']
    gender = request.POST['radiobutton']
    dob = request.POST['txtdob']
    date=request.POST['txtdate']
    blood_gp = request.POST['txtbloodgp']
    email_id = request.POST['textfield21']

    ob1=patient()
    ob1.Fname = Fname
    ob1.Lname = Lname
    ob1.place = place
    ob1.post_office = post_office
    ob1.pin_code = pin_code
    ob1.phone_number = phone_number
    ob1.gender = gender
    ob1.dob = dob
    ob1.date=datetime.today()
    ob1.blood_gp = blood_gp
    ob1.email_id = email_id
    ob1.save()
    return HttpResponse("<script>alert('Inserted successfully');window.location='/patientRegistration#faq'</script>")
def bookingg(request):
    ob=patient.objects.all()
    ob1 = doctor.objects.all()
    return render(request,"booking.html", {"val": ob,'var':ob1})
def insertbooking(request):
    patid = request.POST['patid']
    regdate = request.POST['regdate']
    regtime = request.POST['regtime']
    docid = request.POST['docid']
    token_number=request.POST['tokenNo']

    ob1 = booking()
    obd = doctor.objects.get(id=docid)
    ob1.doctorid = obd
    obp = patient.objects.get(id=patid)
    ob1.patientid = obp
    ob1.patid = patid
    ob1.token_number = token_number
    ob1.reg_date = regdate
    ob1.reg_time = regtime
    # ob1.docid = docid
    ob1.save()
    return HttpResponse("<script>alert('Inserted successfully');window.location='/booking#faq'</script>")
def viewpat(request,id):
    request.session['bookid']=id
    ob1 = med.objects.all()
    ob=booking.objects.get(id=id)
    ob2=test.objects.all()

    return render(request, "pat.html", {"val": ob,'var':ob1,'vab':ob2})
def recepDoctor(request):
    ob1 = doctor.objects.all()
    return render(request,"Doctor.html", {"val": ob1})
def report(request):
   return render(request,"report.html")
def testname(request):
   ob = test.objects.all()
   return render(request,"Test Name.html",{'val':ob})
def inserttestname(request):
    testname = request.POST['textfield']
    ob1 = test()
    ob1.testName = testname
    ob1.save()
    return HttpResponse("<script>alert('Inserted successfully');window.location='/availableTest#faq'</script>")
def medicinename(request):
   return render(request,"Medicine name.html")
def docname(request):
    ob = doctor.objects.all()
    return render(request,"Docname.html",{'val':ob})
def adddoc(request):
   ob = doctor.objects.all()
   return render(request,"Add doc.html",{'val':ob})
def addnurse(request):
   ob = nurse.objects.all()
   return render(request,"Add nurse.html",{'val':ob})
def addpharm(request):
   ob=pharm.objects.all()
   return render(request,"Add pharm.html",{'val':ob})
def addreceptionist(request):
   ob = receptionist.objects.all()
   return render(request,"Add receptionist.html",{'val':ob})
def docdetail(request):
   ob=mystatus.objects.all()
   return render(request,"DocDetails.html",{'val':ob})
def viewallpat(request):
   ob=patient.objects.all()
   return render(request,"viewpat.html",{'val':ob})
def regnurse(request):
    ob=nurse.objects.all()
    return render(request,"reg form nurse.html",{"val":ob})
def insertregnurse(request):
    Fname = request.POST['txtfname']
    Lname = request.POST['txtlname']
    place = request.POST['txtplace']
    post_office = request.POST['txtPO']
    pin_code = request.POST['txtpin']
    contact_no = request.POST['txtphno']
    gender = request.POST['radiobutton']
    dob = request.POST['txtdob']
    deptName = request.POST['txtdept']
    email_id = request.POST['textfield21']
    uname = request.POST['textfield19']
    passwd = request.POST['textfield10']

    ob = login()
    ob.username = uname
    ob.password = passwd
    ob.type = "nurse"
    ob.save()

    ob1 = nurse()
    ob1.lid = ob
    ob1.Fname = Fname
    ob1.Lname = Lname
    ob1.place = place
    ob1.post_office = post_office
    ob1.pin_code = pin_code
    ob1.contact_no = contact_no
    ob1.gender = gender
    ob1.dob = dob
    ob1.email_id = email_id
    ob1.deptName= deptName
    ob1.save()
    return HttpResponse("<script>alert('Inserted successfully');window.location='/addnurse#faq'</script>")
def regdoc(request):
    ob=doctor.objects.all()
    return render(request,"reg form doc.html",{'val':ob})
def insertregdoc(request):
    Fname = request.POST['textfield']
    Lname = request.POST['textfield2']
    place = request.POST['textfield6']
    post_office = request.POST['textfield7']
    pin_code = request.POST['textfield8']
    contact_no = request.POST['textfield13']
    gender = request.POST['radiobutton']
    dob = request.POST['textfield3']
    email_id = request.POST['textfield21']
    deptName = request.POST['textfield18']
    qualification = request.POST['textfield5']
    uname = request.POST['textfield19']
    passwd = request.POST['textfield10']

    ob = login()
    ob.username=uname
    ob.password=passwd
    ob.type = "doctor"
    ob.save()

    ob1=doctor()
    ob1.lid = ob
    ob1.Fname = Fname
    ob1.Lname = Lname
    ob1.place = place
    ob1.post_office = post_office
    ob1.pin_code = pin_code
    ob1.contact_no = contact_no
    ob1.gender = gender
    ob1.dob = dob
    ob1.email_id = email_id
    ob1.deptName_id = deptName
    ob1.qualification = qualification
    ob1.save()
    return HttpResponse("<script>alert('Inserted successfully');window.location='/adddoc#faq'</script>")
def deletedoc(request,id):
    ob = doctor.objects.get(id=id)
    ob.delete()
    return HttpResponse("<script>alert('deleted successfully');window.location='/adddoc#faq'</script>")
def deleterecep(request,id):
    ob = receptionist.objects.get(id=id)
    ob.delete()
    return HttpResponse("<script>alert('deleted successfully');window.location='/addreceptionist#faq'</script>")
def deletenurse(request,id):
    ob = nurse.objects.get(id=id)
    ob.delete()
    return HttpResponse("<script>alert('deleted successfully');window.location='/addnurse#faq'</script>")
def deletepharm(request,id):
    ob = pharm.objects.get(id=id)
    ob.delete()
    return HttpResponse("<script>alert('deleted successfully');window.location='/addpharm#faq'</script>")

def deletetest(request,id):
    ob = test.objects.get(id=id)
    ob.delete()

    return HttpResponse("<script>alert('deleted successfully');window.location='/availableTest#faq'</script>")
def deletemedicine(request,id):
    ob = med.objects.get(id=id)
    ob.delete()
    return HttpResponse("<script>alert('deleted successfully');window.location='/availableMedicine#faq'</script>")
def searchPatient(request):
    FromDate = request.POST['textfield']
    ToDate = request.POST['textfield2']
    ob = patient.objects.filter(id=request.session['lid'], date__range=(FromDate, ToDate))
    print(ob, "++++++++++++++++++++")
    return render(request, "today pat.html", {"val": ob, 'd1': FromDate, 'd2': ToDate})
# def inserttest(request):
#     return HttpResponse("<script>alert('Inserted successfully');window.location='/availableTest'</script>")
def editpharm(request,id):
    ob = pharm.objects.get(id=id)
    request.session['phid']=ob.id
    return render(request,"editpharm.html",{'val':ob})
def inserteditpharm(request):
    Fname = request.POST['textfield']
    Lname = request.POST['textfield2']
    place = request.POST['textfield6']
    post_office = request.POST['textfield7']
    pin_code = request.POST['textfield8']
    phone_number = request.POST['textfield3']
    gender = request.POST['radiobutton']
    dob = request.POST['textfield13']
    email_id = request.POST['textfield15']

    ob1 = pharm.objects.get(id=request.session['phid'])
    ob1.Fname = Fname
    ob1.Lname = Lname
    ob1.place = place
    ob1.post_office = post_office
    ob1.pin_code = pin_code
    ob1.phone_number = phone_number
    ob1.gender = gender
    ob1.dob = dob
    ob1.email_id = email_id
    ob1.save()
    return HttpResponse("<script>alert('edited successfully');window.location='/addpharm#faq'</script>")
def editdoc(request,id):
    ob = doctor.objects.get(id=id)
    request.session['did']=ob.id
    return render(request,"editdoc.html",{'val':ob})
def editnurse(request,id):
    ob = nurse.objects.get(id=id)
    request.session['nid']=ob.id
    return render(request,"editnurse.html",{'val':ob})
def inserteditdoc(request):
    Fname = request.POST['textfield']
    Lname = request.POST['textfield2']
    place = request.POST['textfield6']
    post_office = request.POST['textfield7']
    pin_code = request.POST['textfield8']
    contact_no = request.POST['textfield13']
    gender = request.POST['radiobutton']
    dob = request.POST['textfield3']
    email_id = request.POST['textfield15']
    deptName = request.POST['textfield4']
    qualification = request.POST['textfield5']

    ob1 = doctor.objects.get(id=request.session['did'])
    ob1.Fname = Fname
    ob1.Lname = Lname
    ob1.place = place
    ob1.post_office = post_office
    ob1.pin_code = pin_code
    ob1.contact_no = contact_no
    ob1.gender = gender
    ob1.dob = dob
    ob1.email_id = email_id
    ob1.deptName_id = deptName
    ob1.qualification = qualification
    ob1.save()
    return HttpResponse("<script>alert('edited successfully');window.location='/adddoc#faq'</script>")
def inserteditnurse(request):
    Fname = request.POST['textfield']
    Lname = request.POST['textfield2']
    place = request.POST['textfield6']
    post_office = request.POST['textfield7']
    pin_code = request.POST['textfield8']
    contact_no = request.POST['textfield13']
    gender = request.POST['radiobutton']
    dob = request.POST['textfield3']
    email_id = request.POST['textfield15']
    deptName = request.POST['textfield4']

    ob1 = nurse.objects.get(id=request.session['nid'])
    ob1.Fname = Fname
    ob1.Lname = Lname
    ob1.place = place
    ob1.post_office = post_office
    ob1.pin_code = pin_code
    ob1.contact_no = contact_no
    ob1.gender = gender
    ob1.dob = dob
    ob1.email_id = email_id
    ob1.deptName = deptName
    ob1.save()
    return HttpResponse("<script>alert('edited successfully');window.location='/addnurse#faq'</script>")
def regpharm(request):
    ob=pharm.objects.all()
    return render(request,"reg form pharm.html",{'val':ob})
def insertregpharm(request):
    Fname = request.POST['textfield']
    Lname = request.POST['textfield2']
    place = request.POST['txtplace']
    post_office = request.POST['txtPO']
    pin_code = request.POST['txtpin']
    phone_number = request.POST['textfield3']
    gender = request.POST['radiobutton']
    dob = request.POST['textfield15']
    email_id = request.POST['textfield21']
    uname = request.POST['textfield19']
    passwd = request.POST['textfield10']

    ob = login()
    ob.username=uname
    ob.password=passwd
    ob.type = "pharmasist"
    ob.save()

    ob1=pharm()
    ob1.lid = ob
    ob1.Fname = Fname
    ob1.Lname = Lname
    ob1.place = place
    ob1.post_office = post_office
    ob1.pin_code = pin_code
    ob1.phone_number = phone_number
    ob1.gender = gender
    ob1.dob = dob
    ob1.email_id = email_id
    ob1.save()
    return HttpResponse("<script>alert('Inserted successfully');window.location='/addpharm#faq'</script>")
def regrecep(request):
    ob=receptionist.objects.all()
    return render(request,"reg form recep.html",{'val':ob})
def insertregrecep(request):
    Fname = request.POST['textfield']
    Lname = request.POST['textfield2']
    place = request.POST['txtplace']
    post_office = request.POST['txtPO']
    pin_code = request.POST['txtpin']
    phone_number = request.POST['textfield3']
    gender = request.POST['radiobutton']
    dob = request.POST['textfield15']
    email_id = request.POST['textfield21']
    uname = request.POST['textfield19']
    passwd = request.POST['textfield10']

    ob = login()
    ob.username=uname
    ob.password=passwd
    ob.type = "receptionist"
    ob.save()

    ob1=receptionist()
    ob1.lid = ob
    ob1.Fname = Fname
    ob1.Lname = Lname
    ob1.place = place
    ob1.post_office = post_office
    ob1.pin_code = pin_code
    ob1.phone_number = phone_number
    ob1.gender = gender
    ob1.dob = dob
    ob1.email_id = email_id
    ob1.save()
    return HttpResponse("<script>alert('Inserted successfully');window.location='/addreceptionist#faq'</script>")
def editrecep(request,id):
    ob = receptionist.objects.get(id=id)
    request.session['rid']=ob.id
    return render(request,"editrecep.html",{'val':ob})
def inserteditrecep(request):
    Fname = request.POST['textfield']
    Lname = request.POST['textfield2']
    place = request.POST['textfield6']
    post_office = request.POST['textfield7']
    pin_code = request.POST['textfield8']
    phone_number = request.POST['textfield3']
    gender = request.POST['radiobutton']
    dob = request.POST['textfield13']
    email_id = request.POST['textfield15']


    ob1 = receptionist.objects.get(id=request.session['rid'])
    ob1.Fname = Fname
    ob1.Lname = Lname
    ob1.place = place
    ob1.post_office = post_office
    ob1.pin_code = pin_code
    ob1.phone_number = phone_number
    ob1.gender = gender
    ob1.dob = dob
    ob1.email_id = email_id
    ob1.save()
    return HttpResponse("<script>alert('edited successfully');window.location='/addreceptionist#faq'</script>")
def logout(request):
    return HttpResponse("<script>alert('do you want to logout');window.location='/'</script>")
