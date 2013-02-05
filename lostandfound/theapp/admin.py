from django.contrib import admin
from lostandfound.theapp.models import *

#class PollAdmin(admin.ModelAdmin):
   # fieldsets = [
    #    ( None,               {'fields': ['question']}),
     #   ('Date information', {'fields': ['pub_date'], 'classes':['collapse']}),
    #]
    #list_display=('question','pub_date')
    #inlines=[ChoiceInline]
admin.site.register(User_information)
admin.site.register(Site)
admin.site.register(Item_category)
#admin.site.register(Item_subcategory)
admin.site.register(Search_without_id)
admin.site.register(Search_with_id)
admin.site.register(Report_found_item)



