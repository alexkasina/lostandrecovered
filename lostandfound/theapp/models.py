from django.db import models


class User_information(models.Model):

      your_name=models.CharField(max_length=40)
      email=models.EmailField(primary_key=True)
      phone_number=models.PositiveIntegerField(max_length=20, null=True)

      def __unicode__(self):
        return u"%s - %s - %s" % (self.your_name, self.email, self.phone_number)

      class Meta:
            verbose_name='User information'
            verbose_name_plural='User information'

      #end of User_information model


class Report_found_item(models.Model):
      user_name=models.CharField(max_length=40)
      email=models.EmailField()
      item_name=models.CharField(max_length=40)
      identity_number=models.CharField(max_length=40, null=True)
      item_category=models.CharField(max_length=40, null=True)
      #item_subcategory=models.CharField(max_length=40, null=True)
      item_brand=models.CharField(max_length=40)
      item_model=models.CharField(max_length=40)
      item_color=models.CharField(max_length=40)
      item_description=models.TextField(max_length=250)
      where_found=models.CharField(max_length=40)
      where_kept=models.TextField(max_length=250)
      location_kept=models.ForeignKey('Site')
 
      def __unicode__(self):
         return u"%s - %s - %s" % (self.identity_number, self.item_name, self.user_name)


      class Meta:
            verbose_name='Report found item'
            verbose_name_plural='Report found items'
 
      #end of Report_found_item model

class Search_with_id(models.Model):  
      user_name=models.CharField(max_length=40)
      email=models.EmailField()
      item_name=models.CharField(max_length=40)   
      identity_number=models.CharField(max_length=50)
      item_description=models.TextField(max_length=250)
      where_lost=models.TextField(max_length=250)

      def __unicode__(self):
         return u"%s - %s - %s" % (self.identity_number, self.item_name, self.user_name)
      
      
      class Meta:
           verbose_name='search with id'
           verbose_name_plural='search with id'

      #end of Search_with_id model


class Search_without_id(models.Model):
      user_name=models.CharField(max_length=40)
      email=models.EmailField()
      item_category=models.CharField(max_length=40)
      #item_subcategory=models.CharField(max_length=40)
      item_name=models.CharField(max_length=40)
      item_brand=models.CharField(max_length=40)
      item_model=models.CharField(max_length=40)
      item_color=models.CharField(max_length=40)
      item_description=models.TextField(max_length=250)
      where_lost=models.TextField(max_length=250)

      def __unicode__(self):
         return u"%s - %s - %s" % (self.item_name, self.user_name, self.email)
      

      class Meta:
           verbose_name='Search without id'
           verbose_name_plural='Search without ids'

      #end of Search_without_id model


class Site(models.Model):
      name=models.CharField(primary_key=True, max_length=40)
      location_lat = models.DecimalField(
        u'Location (latitude)', max_digits=10, decimal_places=7, default=0,
        help_text=u"You can use http://www.itoucmap.com to get a location's coordinates")   
      location_lon = models.DecimalField(
        u'Location (longitude)', max_digits=10, decimal_places=7, default=0,
        help_text=u"You can use http://www.itoucmap.com to get a location's coordinates") 

      def __unicode__(self):
         return u"%s" % (self.name)
        
      #end of Site model
      
    
class Item_category(models.Model):
      item_category=models.CharField(max_length=40, primary_key=True)

      def __unicode__(self):
         return u"%s" % (self.item_category)

      class Meta:
           verbose_name='Item category'
           verbose_name_plural='Item categories'

      #end of UItem_category model



class Item_subcategory(models.Model):
      item_subcategory=models.CharField(max_length=40)
      item_category=models.ForeignKey('Item_category')

      def __unicode__(self):
        return u"%s" % (self.item_subcategory)


      class Meta:
           verbose_name='Item subcategory'
           verbose_name_plural='Item subcategories'



      #end of Item_subcategory model

