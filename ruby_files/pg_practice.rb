require 'pg'

def connect 
  PG::Connection.open(dbname:'classmates_db')
end

def result(table_name)
  connect.exec(table_name)
end

def input_data(table_name, first_name, last_name, twitter)
  sql = %q[
    INSERT INTO
  ]
  connect.exec('INSERT INTO ' + table_name+ 