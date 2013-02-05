from django import forms
from lostandfound.theapp.models import *
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout, Fieldset, Submit, Div, HTML

CATEGORY_CHOICES=(
         ( '','Choose a category'),
         ('bags','Bags, Baggage, Luggage'),
         ('shoes','Shoes'),
         ('electronics','Electronics'),
         ('jewellery','Jewellery'),
         ('stationary','Stationary'),
         ('percel','Percel, Mail'),
         ('media','Media'),
         ('medical','Medical stuff'),
         ('musical','Musical instruments'),
         ('accessories','Personal accessories'),
         ('sporting','Sporting goods'),
         ('ticket','Bus tickets'),
         ('other','others'),
)

SUB_CATEGORY_CHOICES=(
         ( '','Choose a sub_category'),
         ( 'dogs','Dogs')
)

 ##    
class Report_found_item_form_Pi(forms.Form):
         your_name=forms.CharField(max_length=40)
         email=forms.EmailField()

         def __init__(self, *args, **kwargs):
               self.helper = FormHelper()
               super(Report_found_item_form_Pi, self).__init__(*args, **kwargs)
               self.helper.layout=Layout(Fieldset('','your_name','email'))
        
class Report_found_item_form_Ii(forms.Form):
         item_name=forms.CharField(max_length=40)
         identity_number=forms.CharField(max_length=40, required=False, help_text="A number on the item which can uniquely identify the item eg, the number on id card, passport, drivers licence e.t.c  NOTE: You may leave blank if no number on the item" )
         item_category=forms.ModelMultipleChoiceField(queryset=Item_category.objects.all(), help_text='select the item category')
         #item_subcategory=forms.ModelMultipleChoiceField(queryset=Item_subcategory.objects.all(), help_text='select the item sub_category corrsponding to above category')
         item_brand=forms.CharField(max_length=40, required=False)
         item_model=forms.CharField(max_length=40, required=False)
         item_color=forms.CharField(max_length=40, required=False)
         item_description=forms.CharField(widget=forms.Textarea, max_length=250, help_text='Detailed Description: Name, Size, Weight, Type, Contents')
         where_found=forms.CharField(max_length=40, help_text='The location where the item was collected')
         where_kept=forms.CharField(widget=forms.Textarea, max_length=250)
         location_kept=forms.ModelMultipleChoiceField(queryset=Site.objects.all(),help_text='select the geographical location to enable owner to trace the place ')

         def __init__(self, *args, **kwargs):
               self.helper = FormHelper()
               super(Report_found_item_form_Ii, self).__init__(*args, **kwargs)

###
class Search_lost_withid_form_Pi(forms.Form):
         your_name=forms.CharField(max_length=40)
         email=forms.EmailField()
         phone_number=forms.IntegerField(min_value=4,  help_text='Your number will be kept secret and be used to notify you incase the item is found later.')

         def __init__(self, *args, **kwargs):
               self.helper = FormHelper()
               super(Search_lost_withid_form_Pi, self).__init__(*args, **kwargs)
               self.helper.form_tag=False
               self.helper.layout=Layout(Div(
               Div('your_name', css_class='span5'),
               Div('email', css_class='span5'),
               Div('phone_number', css_class='span5'),
))

class Search_lost_withid_form_Ii(forms.Form):
         item_name=forms.CharField(max_length=40)
         identity_number=forms.CharField(max_length=40, help_text="A number on the item which can uniquely identify the item eg, the number on id card,  passport, drivers licence e.t.c")             
         where_lost=forms.CharField(widget=forms.Textarea, max_length=250, help_text='where the item got lost eg. kimathi uni, nyeri town e.t.c')
         item_description=forms.CharField(widget=forms.Textarea, max_length=250)


         def __init__(self, *args, **kwargs):
               self.helper = FormHelper()
               super(Search_lost_withid_form_Ii, self).__init__(*args, **kwargs)

#######     
class Search_lost_noid_form_Pi(forms.Form):
         your_name=forms.CharField(max_length=40)
         email=forms.EmailField()
         phone_number=forms.IntegerField(min_value=4, help_text='Your number will be kept secret and be used to notify you incase the item is found later.')


         def __init__(self, *args, **kwargs):
               self.helper = FormHelper()
               super(Search_lost_noid_form_Pi, self).__init__(*args, **kwargs)

class Search_lost_noid_form_Ii(forms.Form):
         item_category=forms.ModelMultipleChoiceField(queryset=Item_category.objects.all(), help_text='select the item category')
         #item_subcategory=forms.ChoiceField( choices=SUB_CATEGORY_CHOICES)
         item_name=forms.CharField(max_length=40)
         item_brand=forms.CharField(max_length=40)
         item_model=forms.CharField(max_length=40)
         item_color=forms.CharField(max_length=40)
         item_description=forms.CharField(widget=forms.Textarea, max_length=250, help_text='Detailed Description: Name, Size, Weight, Type, Contents')
         where_lost=forms.CharField(widget=forms.Textarea, max_length=250,help_text='where the item got lost eg. kimathi uni, nyeri town e.t.c')



         def __init__(self, *args, **kwargs):
               self.helper = FormHelper()
               super(Search_lost_noid_form_Ii, self).__init__(*args, **kwargs)


#
