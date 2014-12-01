
# What is the output of the following expression.
 
if !"nick"
  puts "He's a cool guy!"
end

#=> this says if not nick then it should print the string
# => since there is no input I assume it returns nothing??

##############################################################

# What is the value of x?

def check_truth?(statement)
  if statement == nil
   "Neither exactly true nor false"
  elsif statement == true
   "It's true!"
  else
   "I admit, tis' false."
  end
end

x = check_truth?("Ruby is awesome!") 

#=> "It's true!"   

##############################################################

# What is the value of x?

def consume_arr(y)
 y.each { |elem| puts (elem*2) }
end

x = consume_arr([2,4,6])

#=> x = [4,8,12]
 
##############################################################
 
 
# The following 3 lines of code have errors. Please correct them.
# You can change them in place.
 
var_name = "Nick McDonnough"
pop_punk = "Blink" + "182"
7.0 / 2 == 3.5   # there are multiple acceptable answers for this one.
 
##############################################################
 
# What is the output of the following code 
 
def recursion(x)
  return "HEYO!" if x >= 5
  puts x
  recursion x += 1
end
 
recursion(0)   #=> 0 -- 1 -- 2 -- 3 -- 4 -- "HEYO!"
 
recursion(6)   #=> "HEYO!"
 
##############################################################
 
# Given the following data structure please answer the
# questions below it
 
ballers = [
  {:name => "Michael Jordan", :team => "Chicago"},
  {:name => "Larry Bird", :team => "Boston"},
  {:name => "Isiah Thomas", :team => "Detroit"}
]
 
# How would you access Larry Bird's team?
# ballers[1][:team]
 
# How would you return an array containing only the player names?
# array = []
# ballers.select{|name| array << name[:name]}
 
##############################################################
 
# Using the above hash, what does the following return?
ballers[-1].size    #=> 2
 
##############################################################
 
# Return the cast members of The Sopranos as a single
# string separated by commas.
 
tv_shows = {
  "Mad Men" => {:network => "AMC", :cast => ["John Hamm", "John Slattery", "Elizabeth Olson"]},
  "Dexter" => {:network => "Showtime", :cast => ["Michael C. Hall", "Jennifer Carpenter", "CS Lee"]},
  "The Sopranos" => {:network => "HBO", :cast => ["James Gandolfini", "Michael Imperioli", "Edie Falco"]}
}
 
# tv_show["The Sopranos"][:cast].join(", ")
 
##############################################################
 
# Iterate through 'words' and return the following sentence:
#    "I'm excited for MakerSquare!""
 
words = [
  ["I'm", "eating", "pizza"],
  ["Excited", "begins", "with", "E"],
  ["For", "sale"],
  ["MakerSquare", "is", "awesome!"]
]
 
# string = "" 
# words.each {|x| string << x[0] + " "}
# 
### is there a way to downcase the words without knowing the 
### the length of the string, which are proper nouns, and their
### position in the string

##############################################################
 
# How would I access the value "Austin" in this hash?
 
person = {
  :name => "Nick McDonnough",
  :age => 28,
  :address => {
    :street => "2520 Elmont St",
    :city => "Austin",
    :state => "TX"
  }
}

# person[:address][:city]

 
##############################################################

# Iterate through 'nums' and return a new array containing
# only numbers larger than 10. Bonus if the array is sorted
# from highest to lowest.

nums = [2, 9, 3, 12, 7, 5, 99, 5, 62]

#nums.sort.select {|x| x if x > 10}

##############################################################
 
# What does the 'initialize' method do?
# A sentence or two will suffice.
 ## it gives starting parameters to a new class object
 
##############################################################
 
# Create a Person class based off of this behavior
# This will take up many lines. You can start your answer here.
 
class Person
  attr_accessor :kids, :name
  def initialize(name, age)
    @name= name
    @age = age
    @kids = []
  end
  def birthday
    @age+=1
  end
  def age
    puts @age
  end
  def kids
      @kids
  end
  def family
    puts "#{@name} has #{kids.length} children:"
    @kids.each {|person| puts person.name}
  end
end

bobby = Person.new("Bobby", 28)
bobby.age  #=> 28
bobby.birthday
bobby.birthday
bobby.age  #=> 30
 
tim = Person.new("Tim", 1)
sam = Person.new("Sam", 1)
 
bobby.kids << tim
bobby.kids << sam

bobby.family  #=> "Bobby has 2 children:
              #=>  Tim,
              #=>  Sam"
# I could only get this to print the person class stuff
# how do I get inside of Tim and Sam's class?
 
##############################################################
 
# Create a new class Person that is initialized with a name
# In the Person class create a method 'talk' that takes a single parameter
# and prints it to the screen.
# Create a Singer class that inherits from Person. Singer should have a
# method 'sing'. The following code describes the behaviour of the classes.
 
# This will take up many lines. You can start your answer here.
 class Person
  def initialize(name)
    @name = name
  end
  def greet
    puts "Hello, I'm #{@name}"
  end
  def talk (string)
    puts string
  end
end

class Singer < Person
  def sing
    puts "LaLaLa"
  end
end

 
aretha = Singer.new("Aretha Franklin")
aretha.greet  #=> "Hey, there! I'm Aretha Franklin!"
aretha.sing   #=> "R-E-S-P-E-C-T. Find out what it means to me!"
 
nick = Person.new("Nick")
nick.greet   #=> "Hey, there! I'm Nick!"
nick.talk("Prework is super important!")  #=> "Prework is super important!"
nick.sing  #=> NoMethodError
 
##############################################################
 
# create a Product class that implements the following code
class Product
  @count = 0 
  def self.new(name)
    @count+=1
  end
  def self.product_count
    puts @count
  end
end

Product.product_count # => 0
widget1 = Product.new('widget')
Product.product_count # => 1
widget2 = Product.new('widget')
Product.product_count # => 2
widget2.product_count # => NoMethodError