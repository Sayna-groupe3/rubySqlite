require 'sqlite3'

#creation de la base de donnée contacts
db = SQLite3::Database.open 'dataContact.db'

#Creation de la table contacte
db.execute "CREATE TABLE IF NOT EXISTS contacts(id INTEGER PRIMARY KEY AUTOINCREMENT,name text,adress text)"

#insertion data dans la table contacts

db.execute "INSERT INTO contacts (name,adress) VALUES ('lova','avaratsena' )"
db.execute "INSERT INTO contacts (name,adress) VALUES ('sitraka','nanisana' )"
db.execute "INSERT INTO contacts (name,adress) VALUES ('lanto','mahamasina' )"
db.execute "INSERT INTO contacts (name,adress) VALUES ('setra','analakely' )"

#recuperation de tout les contacts enregistrer
puts "recuperation de tt les contacts enregister"
selectAll = db.execute "SELECT * FROM contacts"
print selectAll
puts "\n========================================================"

#modification du contact avec id = 2
puts "modification du contacts avec id = 2"
db.execute "UPDATE contacts SET name = 'test', adress = 'tanjobato' WHERE id = 2"

#recuperation de tout les contact enregistrer 
selectAll = db.execute "SELECT * FROM contacts"
print selectAll
puts "\n======================================================="

#suppression du contact avec  id = 4
puts "suppression du contact avec  id = 4"
db.execute "DELETE FROM contacts WHERE id=4"

#recuperation de tout les contact enregistrer 
selectAll = db.execute "SELECT * FROM contacts"
print selectAll
puts ""

#fermeture de la base de donnée
db.close
