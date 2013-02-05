import urllib
import urllib2
import json

class AfricasTalkingGateway:
    
    def __init__(self, username_, apiKey_):
	self.username = username_
	self.apiKey   = apiKey_
	
	self.URLString = "https://api.africastalking.com/version1/messaging"
	
    def sendMessage (self, to_, message_, from_ = "", bulkSMSMode_ = 1):
	
	'''
	 The optional from_ parameter should be populated with the value of a shortcode or alphanumeric that is 
	 registered with us 
	 The optional  will be used by the Mobile Service Provider to determine who gets billed for a 
	 message sent using a Mobile-Terminated ShortCode. The default value is 1 (which means that 
	 you, the sender, gets charged). This parameter will be ignored for messages sent using 
	 alphanumerics or Mobile-Originated shortcodes.
	 '''
	
	values = {'username' : self.username,
		  'to'       : to_,
		  'message'  : message_ }

	if len(from_) > 0 :
	    values ["from"] = from_
	    values ["bulkSMSMode"] = bulkSMSMode_
	
	headers = {'Accept' : 'application/json',
		   'apikey' : self.apiKey }
	
	data     = urllib.urlencode(values)
	request  = urllib2.Request(self.URLString, data, headers=headers)
	response = urllib2.urlopen(request)
	the_page = response.read()
	
	decoded = json.loads(the_page)
	
	recipients = decoded['SMSMessageData']['Recipients']
	return recipients

    def fetchMessages (self, lastReceivedId_):
	
	url     = "%s?username=%s&lastReceivedId=%s" % (self.URLString, self.username, lastReceivedId_)
	headers = {'Accept' : 'application/json',
		   'apikey' : self.apiKey }
	
	request  = urllib2.Request(url, headers=headers)
	response = urllib2.urlopen(request)
	the_page = response.read()
	
	decoded  = json.loads(the_page)
	messages = decoded['SMSMessageData']['Messages']
	
	return messages
