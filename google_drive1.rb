require "google_drive"
require_relative "mairie1.rb"
puts $mon_hash
#setup_spreadsheet
session = GoogleDrive::Session.from_config("config.json")
$ws = session.spreadsheet_by_key("1q7szVLZG-An5-CnzkdsGXayvRTBLlTA0ROjs2RH-wxU").worksheets[0]

#get_the_hash_that_I_scrapped_few_days_ago

def get_the_hash 

	i = 2 
	$mon_hash.each {|key,value|
	$ws[i,1]=key
	$ws[i,2]=value  
	i = i + 1}


$ws.save 

end

get_the_hash