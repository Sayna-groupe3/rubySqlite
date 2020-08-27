require 'sqlite3'

def selectAllContacts()
	db = SQLite3::Database.open 'dataContact.db'
	db.execute "CREATE TABLE IF NOT EXISTS contacts(id INTEGER PRIMARY KEY AUTOINCREMENT,name text,adress text)"
	resultat = db.execute "SELECT * FROM contacts"
	print resultat
end

def createContact(name,adress)
	db = SQLite3::Database.open 'dataContact.db'
	db.execute "CREATE TABLE IF NOT EXISTS contacts(id INTEGER PRIMARY KEY AUTOINCREMENT,name text,adress text)"
	db.execute "INSERT  INTO contacts (name,adress) VALUES ('#{name}','#{adress}')"	
end

def deleteContact(id)
	db = SQLite3::Database.open 'dataContact.db'
	db.execute "CREATE TABLE IF NOT EXISTS contacts(id INTEGER PRIMARY KEY AUTOINCREMENT,name text,adress text)"
	db.execute "DELETE FROM contacts WHERE id = #{id}"
end

def updateContact(id,name,adress)
	db = SQLite3::Database.open 'dataContact.db'
	db.execute "CREATE TABLE IF NOT EXISTS contacts(id INTEGER PRIMARY KEY AUTOINCREMENT,name text,adress text)"
	db.execute "UPDATE contacts SET name = '#{name}', adress = '#{adress}' WHERE id = #{id}"
end

def searchContact(id)
	db = SQLite3::Database.open 'dataContact.db'
	db.execute "CREATE TABLE IF NOT EXISTS contacts(id INTEGER PRIMARY KEY AUTOINCREMENT,name text,adress text)"
	resultat = db.execute "SELECT * FROM contacts WHERE id = #{id}"
	puts "resultat de votre recherche"
	puts resultat
end

puts "\nSaisir ' 1 ' pour tester le programme et ' 6 ' pour quitter ! ! !"
n = gets.chomp
n = n.to_i
if n==6
    puts "\nMerci >_< !"
end 
while n!=6
    puts "\n\tCRUD Sqlite "
    puts "\n-------||| MENUS |||-------"
    puts "Saisir: 1 -> lister tout les contact"
    puts "Saisir: 2 -> cree un contact"
    puts "Saisir: 3 -> supprimer un contact"
    puts "Saisir: 4 -> modifer un contact"
    puts "Saisir: 5 -> rechercher  un contact"
    puts "\nVotre choix:"
    n = gets.chomp
    n = n.to_i

    case n
        when 1
    		selectAllContacts()       
        when 2
    		puts "nom du contact :"
			name = gets.to_s
			puts "addresse contact :"
			adress = gets.to_s
			createContact(name,adress)
			puts "contact enregister!"
        when 3
        	puts "saisir l\'id de contact a supprimer : "
        	id = gets.to_i
            deleteContact(id)
            puts "contact supprimer"
        when 4
        	puts "Modification du contact: "
        	puts "saisir l\' id du contact :"
        	id = gets.to_i
        	puts "nouveau nom du contact :"
        	name = gets.to_s
        	puts "nouveau addresse du contact :"
        	adress = gets.to_s
            updateContact(id,name,adress)
            puts "contact modifie"
        when 5
        	puts "Chercher un contact: "
        	puts "saisir l\' id du contact :"
        	id = gets.to_i
            searchContact(id)
        when 6
            #choix 6 :pour qutter le programme
            puts "\nMerci de tester le programme >_< !"
            break 
    end
end