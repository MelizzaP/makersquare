require 'pg'


class Practice
  attr_reader :database
  
  def self.intialize 
    @database = PG::Connection.open(dbname:'classmates_db')
  end
  
  def create_table
    sql = %q[
      CREATE TABLE IF NOT EXISTS people(
        first_name     VARCHAR,
        last_name      VARCHAR,
        twitter        VARCHAR,
        id             INTEGER SERIAL PRIMARY KEY
      )  
    ]
    database.exec(sql)
  end
  
  def input_data(first, last, twitter)
    sql = %q[
      INSERT INTO 
        people (first_name, last_name, twitter)
      VALUES 
        ($1,$2,$3)
    ]
    database.exec(sql,[first,last,twitter])
  end 
  
  def view_all_records
    result = database.exec('SELECT * FROM people')
    puts result.entries
  end
  
  def delete_a_record(id)
    sql = %q[
      DELETE FROM 
        people
      WHERE
         id = ($1)
    ]
    database.exec(sql,[id])
    puts "Entry with id #{id} deleted."
  end
  
end