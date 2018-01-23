require "google_drive"
require "gmail"
require "json"
require_relative "google_drive.rb"

#Hello :) je n'ai pas mis mon fichier json et mes identifiants sur le drive, sorry d'avance car 
#il ne sera pas possible d'exécuter le programme 
#Bonne lecture ! 
	
	
$gmail = Gmail.connect!(ENV["USERNAME"],ENV["PASSWORD"])
 	
 	#Ce nouveau hash va permettre de récupérer les données sur la spreadsheet google
$new_hash = Hash.new

def go_through_all_the_lines
		#On part de la 2e ligne
	i=2
		#De 1 au nombre de maires contenu dans le hash on récupére le nom ainsi  que l'email
	for num in 1..$mon_hash.size
	mairies = $ws[i,1]
	emails = $ws[i,2]
		#On enregistre les données dans le new_hash
	$new_hash [mairies] = emails
	i+=1
	end
end

go_through_all_the_lines


def send_email_to_line
	$new_hash.each{|mairie, email|
	$gmail.deliver do
	#Ceci est mon adresse gmail, remplacer par #{email} pour envoyer aux mairies
  	to ""
  	subject "THP c'est super"
  	html_part do
  	content_type 'text/html; charset=UTF-8'
	body "<p>Bonjour,<br/>
"
	end
	end
	#Compteur pour ne pas se faire bloquer son compte
	 sleep(30)
	}
end
send_email_to_line
$gmail.logout
