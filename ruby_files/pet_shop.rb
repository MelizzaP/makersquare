require 'pg'
require 'rest-client'
require 'json'
require 'pry-byebug'

def create_tables
  shop_sql = %q[
    CREATE TABLE IF NOT EXISTS shops(
      name   varchar,
      id     integer unique primary key
      );
  ]
  connect.exec(shop_sql)

  cat_sql = %q[
    CREATE TABLE IF NOT EXISTS cats(
      shop_id     integer references shops (id),
      name        varchar,
      image_url   varchar,
      adopted     boolean,
      id          integer unique primary key
      );  
  ]  
  connect.exec(cat_sql)
  
  dog_sql = %q[
    CREATE TABLE IF NOT EXISTS dogs(
      shop_id     integer references shops (id),
      name        varchar,
      image_url   varchar,
      happiness   varchar,
      adopted     boolean,
      id          integer unique primary key
      );
  ]
  
  connect.exec(dog_sql)
end


def connect 
  PG::Connection.open(dbname:'petshop_db')                                   
end


def add_data_to_tables
  @shops = []
  @shops = @shop_data.each do |shop|
    sql = %q[
      INSERT INTO 
        shops (name,id)
      VALUES
        ($1,$2)
      ]
    connect.exec(sql,[shop["name"],shop["id"]])
    end
    
  @cats = []      
  @cats = @cat_data.each do |shop|
    shop.each do |cat|
    p cat
      sql = %q[
        INSERT INTO
          cats (shop_id,name,image_url,adopted,id)
        VALUES
          ($1,$2,$3,$4,$5)      
      ]
      connect.exec(sql,
        [cat["shopId"],cat["name"],cat["imageUrl"],cat["adopted"],cat["id"]])
    end
  end
  
    @dogs = []
   @dogs = @dog_data.each do |shop|
    shop.each do |dog|
      sql = %q[
        INSERT INTO
          dogs (shop_id,name,image_url,happiness,adopted, id)
        VALUES
           ($1,$2,$3,$4,$5,$6)
      ]
      
      connect.exec(sql,
        [dog["shopId"],dog["name"],dog["imageUrl"], dog["happiness"],dog["adopted"],dog["id"]]) 
      end  
  end
  
end

def retrieve_data 
  host = "pet-shop.api.mks.io/shops/"
	shop_data = RestClient.get host
	@shop_data = JSON.parse(shop_data)

	@cat_data = []
	@dog_data = []
	@shop_data.each do |shop|
	  url = host+shop["id"].to_s
	  cat_data = RestClient.get url + '/cats'
	  dog_data = RestClient.get url + '/dogs'
	  cat_data = JSON.parse(cat_data)
	  dog_data = JSON.parse(dog_data)
	  @cat_data << cat_data
	  @dog_data << dog_data
  end
  create_tables
  add_data_to_tables
 	 
end

def shop_name_id_table
   result = connect.exec('SELECT * FROM shops ORDER BY id')
   result.entries
   puts "ID |   NAME"
   puts "_________________________"
   result.entries.each{|entry| puts "#{entry['id']}  | #{entry['name']}"}
end


  
	
	