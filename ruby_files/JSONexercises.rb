
book = {
	title: "Gourd of the Flies",
	author: "G.W. Gourding"
}

lib = [
	{
		title: "Design Patterns", 
		author: ["John Vlissides", "Richard Helm", "Ralph Johnson", "Erich Gamma"]
	},
	{
		title: "Patterns of Enterprise Application Architecture", 
		author: ["Martin Fowler"]
	},
	{
		title: "Domain Driven Design", 
		author:["Eric Evans"]
	}
]


volunteer = {
	name: "Alice",
	age: 25,
	phone: "555-555-555",
	position: "Receptionist"
} 

rhode_island {
	abbrev: "RI",
	population:1_050_292,
	residents: "Rhode Islanders",
	capital: "Providence",
	lgest_cities: ["Providence", "Warwick", "Cranston"],
	govenor: "Lincoln Chaffee",
	median_income: 54619
}

patrick_laptop = {
	brand: "Apple",
	model: "Macbook-air",
	storage: {
		size:256,
		type: "SSD"
		},
	memory:8,
	display: "Retina"
	cpu:{
		manufacturer:"Intel"
		model: "i7"
	},
	preloaded_software: ["iPhoto", "Safari", "iMovie", "iMessage"]
}

nick_dogs = [
	{
		name:"Maple",
		age: 4,
		color: "brown",
		breed:"Pitbull",
		fav_game: "tug-o-war"
	},
	{
		name:"Atlas",
		age: 3,
		color: "unknown",
		breed:"Boxer",
		fav_game:"fetch"
	}
]

pizza_palace = {
	location:"716 Congress",
	health_score:100,
	menu: {
		appetizer: ["mozarella sticks","calzone","garlic knots"],
		mains:["chicken parmigana", "pizza slice", "spaghetti and eggplant"],
		dessert: ["tiramisu", "cannoli", "cheesecake"]
	}
}

class Restaurants
  attr_accessor :menu
	
	def initialize(name,location, health_score)
		@name = name
		@location = location
		@health_score = health_score
		restaurant = {
      name: @name, 
      location: @location, 
      health_score: @health_score, 
      menu:{appetizer: [], mains:[], dessert:[]}
    }
	end
  def add_menu_item(category, item)
    @menu[category] << item
  end
end