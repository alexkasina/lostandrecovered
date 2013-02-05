from django.core.context_processors import csrf
from django.shortcuts import render
from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect
from lostandfound.theapp.models import *
from lostandfound.theapp.forms import *
from django.template import RequestContext
from django.db.models import Q
import sys
import AfricasTalkingGateway as ATG
from django.core.mail import EmailMessage



def home(request):
    return render_to_response('home.html', context_instance=RequestContext(request))


def search(request): 
    
    if request.method == 'POST':
       formPi = Search_lost_withid_form_Pi(request.POST)
       formIi = Search_lost_withid_form_Ii(request.POST)
       c = {}
       c.update(csrf(request))#to prevent the POST method from raising csrf error 
       if formPi.is_valid() & formIi.is_valid():
          your_name=request.POST.get('your_name','')
          email=request.POST.get('email','')
          phone_number=request.POST.get('phone_number','')
          item_name=request.POST.get('item_name','')
          identity_number=request.POST.get('identity_number','')
          where_lost=request.POST.get('where_lost','')  
          item_description=request.POST.get('item_description','')

          no=[]
          results=[]
          siteobjlat=[]
          siteobjlon=[]
          sitename=[]
          identity_no=[]
          try:
             results=Report_found_item.objects.filter(identity_number__icontains=identity_number)
             identity_no=Search_with_id.objects.get(identity_number=identity_number).identity_number
             #no=Report_found_item.objects.get(identity_number=identity_number).item_category
             siteobjlat=Site.objects.get(name=Report_found_item.objects.get(identity_number=identity_number).location_kept).location_lat
             siteobjlon=Site.objects.get(name=Report_found_item.objects.get(identity_number=identity_number).location_kept).location_lon
          except:
               None 

        
          if identity_number!=identity_no:
        
		  data_save_objUser=User_information(your_name=your_name,email=email,phone_number=phone_number)
		  data_save_obj= Search_with_id(user_name=your_name, email=email, item_name=item_name,  
		                           identity_number=identity_number,item_description=item_description,where_lost=where_lost)
		  data_save_objUser.save()
		  data_save_obj.save()
          
          return render_to_response('searchidfeedback.html',
                        {'results':results,
                         'identity_number':identity_number,'location_lat':siteobjlat,'location_lon':siteobjlon})
       
      
    else:
       formPi = Search_lost_withid_form_Pi()
       formIi = Search_lost_withid_form_Ii()
       c = {}
       c.update(csrf(request))
       
    return render(request, 'searchitem.html',  {'formPi':formPi, 'formIi':formIi})
  


def search_without(request):
           
    
    if request.method == 'POST':
       formPi = Search_lost_noid_form_Pi(request.POST)
       formIi = Search_lost_noid_form_Ii(request.POST)
       c = {}
       c.update(csrf(request))
       if formPi.is_valid() & formIi.is_valid():
          your_name=request.POST.get('your_name','')
          email=request.POST.get('email','')
          phone_number= request.POST.get('phone_number','')
          item_category=request.POST.get('item_category','')
          item_subcategory=request.POST.get('item_subcategory','')
          item_name=request.POST.get('item_name','')
          item_brand=request.POST.get('item_brand','')
          item_model=request.POST.get('item_model','')
          item_color=request.POST.get('item_color','')
          item_description=request.POST.get('item_description','')
          where_lost=request.POST.get('where_lost','')

          results = Report_found_item.objects.filter(
                (Q(item_category__icontains=item_category) &
                Q(item_name__icontains=item_name))).distinct()
 
                 #no=Report_found_item.objects.get(identity_number=identity_number).item_category

          category=[]
          email_verif=[]
          itemname=[]
          siteobjlat=[]
          siteobjlon=[]

          try:
                  category=Search_without_id.objects.get(item_category=item_category).item_category
                  email_verif=Search_without_id.objects.get(email=email).email
                  itemname=Search_without_id.objects.get(item_name=item_name).item_name
                  siteobjlat=Site.objects.get(name=results[0].location_kept).location_lat
                  siteobjlon=Site.objects.get(name=results[0].location_kept).location_lon
          

          except:
                    None     
          
	  data_save_objUser=User_information(your_name=your_name,email=email,phone_number=phone_number)  
	  data_save_obj= Search_without_id(user_name=your_name,email=email,item_category=item_category,             item_name=item_name,item_brand=item_brand,item_color=item_color,item_description=item_description,where_lost=where_lost)
		 
	  data_save_objUser.save()
	  data_save_obj.save()
		       

          return render_to_response('searchnoidfeedback .html',
                        { 'results':results,
                          'item_name':item_name,
                          'location_lat':siteobjlat,
                          'location_lon':siteobjlon})

       
    else:
          formPi =  Search_lost_noid_form_Pi()
          formIi =  Search_lost_noid_form_Ii()
          c = {}
          c.update(csrf(request))
       
    return render(request, 'searchitemwithout.html',  {'formPi':formPi, 'formIi':formIi})



def report(request): 
   
   
    if request.method == 'POST':
       formPi = Report_found_item_form_Pi(request.POST)
       formIi = Report_found_item_form_Ii(request.POST)
       c = {}
       c.update(csrf(request))#to prevent the POST method from raising csrf error 
       if formIi.is_valid() & formPi.is_valid():
          your_name=request.POST.get('your_name','')
          email=request.POST.get('email','')
          item_name=request.POST.get('item_name','')
          identity_number=request.POST.get('identity_number','')
          item_category=request.POST.get('item_category','')
          #item_subcategory=request.POST.get('item_subcategory','')
          item_name=request.POST.get('item_name','')
          item_brand=request.POST.get('item_brand','')
          item_model=request.POST.get('item_model','')
          item_color=request.POST.get('item_color','')
          item_description=request.POST.get('item_description','')
          where_found=request.POST.get('where_found','')
          where_kept=request.POST.get('where_kept','')  
          location_kept=request.POST.get('location_kept','') 
          
          site=Site.objects.get(pk=location_kept)
          identity_no=[]
          results=[]
          resultswithout=[]

          try:
             number=User_information.objects.get(email=Search_with_id.objects.get(identity_number=identity_number).email).phone_number
             identity_no=Report_found_item.objects.get(identity_number=identity_number).identity_number
             results=Search_with_id.objects.filter(identity_number__icontains=identity_number)
             resultswithout = Search_without_id.objects.get(
                (Q(item_category__icontains=item_category) &
                Q(item_name__icontains=item_name))).distinct().email
          except:
             pass

          if results:
                     #send message
                     number=User_information.objects.get(email=Search_with_id.objects.get(identity_number=identity_number).email).phone_number
                     #number1="+254"+str(number)
                     emailadd=Search_with_id.objects.get(identity_number=identity_number).email

		     username = 'mrsupernerd'
		     apikey = '8c263ff1b1a933bc61916b1c99942c6709415b62ebcec4b525b8f21014e1d2a5'

		     gateway = ATG.AfricasTalkingGateway(username, apikey)

		     to      = "+254"+str(number)
		     message = "There is an item reported found which matches your description of the item you reported in www.lostandrecovered.com> go to the site for more details"
		     try:
		       recipients = gateway.sendMessage(to, message)
		       for x in recipients:
		            print 'number=%s;status=%s;cost=%s' % (x['number'], x['status'], x['cost'])
		     except:
		       e = sys.exc_info()[0]
		       print "Error1 while connecting to the gateway: %s" % e 

		       #send mail

		     message = "There is an item reported found which matches your description of the item you reported in www.lostandrecovered.com> go to the site for more details"

                     email = EmailMessage('REPORT ON LOST ITEM', 'Hello, there are descriptions which match the item you searched. Visit our site for more details www.lostandreport.com', to=[emailadd])
		     email.send()

          if resultswithout:
                      #send message
		     username = 'mrsupernerd'
		     apikey   = '8c263ff1b1a933bc61916b1c99942c6709415b62ebcec4b525b8f21014e1d2a5'

		     gateway = ATG.AfricasTalkingGateway(username, apikey)

		     to      = "+85266986346"
		     message = "There is an item reported found which matches your description of the item you reported in www.lostandrecovered.com go to the site for more details"

		     try:
		       recipients = gateway.sendMessage(to, message)
		       for x in recipients:
		            print 'number=%s;status=%s;cost=%s' % (x['number'], x['status'], x['cost'])
		     except:
		       e = sys.exc_info()[0]
		       print "Error2 while connecting to the gateway: %s" % e
           

                       #send mail
		     email = EmailMessage('REPORT ON LOST ITEM', 'Hello, there are descriptions which match the item you searched. Visit our site for more details', to=[resultswithout])
		     email.send()
          if identity_no != identity_number:
		  data_save_objUser=User_information(your_name=your_name,email=email) 
		  data_save_obj= Report_found_item(user_name=your_name, email=email, identity_number=identity_number, item_category=item_category, item_name=item_name, item_brand=item_brand, item_color=item_color, item_model=item_model, item_description=item_description,where_found=where_found,where_kept=where_kept,location_kept=site)
	     
		  data_save_objUser.save()
		  data_save_obj.save()
           
          
          return render_to_response('reportfeedback.html',
                        {'results':results,
                         'resultswithout':resultswithout,
                         'identity_number':identity_number})
       
      
    else:
       formPi = Report_found_item_form_Pi()
       formIi = Report_found_item_form_Ii()
       c = {}
       c.update(csrf(request))
       
    return render(request, 'reportitem.html',  {'formPi':formPi,'formIi':formIi})
  



def thanks(request): 
    
    return render_to_response('thanks.html')
