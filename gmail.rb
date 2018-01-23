require 'gmail'
gmail = Gmail.connect!("Identifiant", "MDP")
gmail.deliver do
  to "amsallem.samuel@gmail.com"
  subject "Having fun in Puerto Rico!"
  text_part do
    body "Wesh alors"
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body "<p> Salut <em>ma</em> couille</p>"
  end

end

