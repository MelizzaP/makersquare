#cookbook class
#created cookbook class should take a title input
class Cookbook
  attr_accessor :title #will allow user to set and get cookbook title
  attr_accessor :recipes #will allow user to set and get recipes
  
  def initialize(title)  # initilize method will allow user to name cookbook
    @title = title  # user will set title of cookbook
    @recipes = []  # will write an empty recipes array when initilizing
  end
  
  def add_recipe(recipe)
        @recipes << recipe  #will push recipe into the cookbook
    puts "Added a recipe to the collection: #{recipe.title}" #prints the recipe added to cookbook
  end
    
  def recipe_titles
  	rec_tit = {} #creates hash
  	@recipes.each_with_index{|item, index| 
  	  rec_tit[item] = index
  	  }      								#takes array and stores objects in hash
  	  
  	  rec_tit.each do |item, index|  #loops through hash and prints titles
  	    puts item.title
  	 end
  	 
	#@recipes.each{|n| rec_tit << n.title} #loops through recipes array and adds titles to rec_tit
	#puts rec_tit #prints recipe titles array
  end
   
  def recipe_ingredients
  	tit_ing = {}  #creates hash
  	@recipes.each_with_index{|item, index|
	  	tit_ing[item] = index
  	}									#takes array and stores items in hash
  	
  	tit_ing.each do |item, index|	#loops through hash and prints title and ingredients
  		puts "These are the ingredients for #{item.title}: #{item.ingredients}"
    end
    
  end 
  
  def print_cookbook  #prints cookbook, by calling method from recipe class
    pr_cr = {}  #creates empty hash
    @recipes.each_with_index{|item, index|	# takes array and stores objects in hash
	    pr_cr[item] = index
    }
    
    pr_cr.each do |item, index|  #takes each recipe in cookbook and calls method print_recipe from recipe class
      item.print_recipe
    end
  end
  
  def delete_recipe(recipe)  #removes a recipe from cookbook
  	@recipes.delete(recipe)
  	puts "#{recipe.title} has been deleted from your #{title} cookbook."
  end
  
end

#recipe class
#created recipe class should take a title (string), ingredients (array), and steps (array)
class Recipe
   attr_accessor :title 
   attr_accessor :steps
   attr_accessor :ingredients 
     #these methods will allow user to both set and get recipe title, ingredients, and steps
   
   def initialize(title, ingredients, steps)  #initialize method will allow user to set up title, ingredients, and steps
     @title = title
     @ingredients = ingredients
     @steps = steps
   end
  
  def print_recipe  #prints out recipe in a badass format
    puts "*** #{title} ***"   #prints recipe name 
    puts "The ingredients are: #{ingredients.join(", ")}"  #prints ingredients with comma seperating
    puts "Follow these steps to prepare: "  
    steps.each {|n| puts "#{steps.index("#{n}")+1}. #{n}"}  #prints steps in order with numbering and one to each line
  end
     
end
