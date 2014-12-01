# SETUP  
#1  create database called classmates_db, create
	# create table in classmates_db 

# createdb classmates_db
# 
#  create table people(
#  	first_name		VARCHAR,
#  	last_name		VARCHAR,
#  	twitter			VARCHAR
#  );


#2 Write a method that establishes a connection to your database 
# 	and returns that connection object. Remember: this is the object 
# 	on which you will call the method exec in order to send your queries 
# 	to the database.
require 'pg'

def createTables
	# this allows you to use multi-line 
	 # strings with single quotes also 
	 #<<-SOMEPHRASE ... SOMEPHRASE does double quotes
	sql = %q[
		CREATE TABLE IF NOT EXISTS classmates(
			id 						SERIAL PRIMARY KEY,
			first_name		VARCHAR,
			last_name			VARCHAR,
			twitter				VARCHAR NOT NULL UNIQUE
	]
	
	@db.exec(sql)
end

def connect
  @db = PG::Connection.new(host:'localhost',dbname:'classmates_db')
  # conn = PG::Connection.open(dbname:'classmates_db')
  create_tables
end
  
def result(table_name)
	connect.exec("SELECT * FROM " + table_name)
end

def userInput(table_name)
	puts "Enter your first name"
	first_name = gets.chomp.to_s
	puts "Enter your last name"
	last_name = gets.chomp.to_s
	puts "Enter your twitter handle"
	twitter = gets.chomp.to_s
	connect.exec"INSERT INTO #{table_name} (first_name,last_name,twitter) VALUES ('#{first_name}','#{last_name}','#{twitter}')"
	
end



# connection_object = connect("classmates_db")
result('people').entries

#5 Now that you can enter information at the command line and have it inserted 
	# into your table it is time to build out some more functionality. Examples of things 
	# you might want to do from the command line:
	# View all records
	# Delete a particular record
	# Update a particular record
	
def viewAllRecord (table_name)
	connect.exec"SELECT * FROM #{table_name}"
end

def deleteRecord(table_name, id)
	connect.exec"DELETE FROM 
	
	
	
	
	
	
	
	
	
	
	
	
	
	