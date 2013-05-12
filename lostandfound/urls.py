from django.conf.urls import patterns, include, url
from lostandfound import settings

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'lostandfound.views.home', name='home'),
    # url(r'^lostandfound/', include('lostandfound.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
     url(r'^admin/', include(admin.site.urls)),
     url(r'^static/(?P<path>.*)$', 'django.views.static.serve', {
            'document_root': settings.STATIC_ROOT,
        }),
     url(r'^searchandreport/$', 'lostandfound.theapp.views.home'),
     url(r'^searchandreport/search/$', 'lostandfound.theapp.views.search'),
     url(r'^searchandreport/report/$', 'lostandfound.theapp.views.report'),
     #url(r'^searchandreport/reportlostw/$', 'lostandfound.theapp.views.report_without'),
      url(r'^searchandreport/searchw/$', 'lostandfound.theapp.views.search_without'),
     url(r'^thanks/$', 'lostandfound.theapp.views.thanks'),
     #url(r'^thanks/$', 'lostandfound.theapp.views.thanks'),
     #url(r'^thanks/$', 'lostandfound.theapp.views.thanks'),
     #url(r'^thanks/$', 'lostandfound.theapp.views.thanks'),

)
