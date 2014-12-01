burrito = Recipe.new("Bean Burrito", ["tortilla", "bean"], ["heat beans", "place beans in tortilla", "roll up"])
burrito.ingredients = ["tortilla", "tomatoes"]
burrito.print_recipe
burrito.steps = ["heat tomatoes", "place tomatoes in tortilla", "roll up"]
burrito.title = "Veggie Burrito"
mex_cuisine = Cookbook.new("Mexican Cooking")
mex_cuisine.add_recipe(burrito)
mex_cuisine.add_recipe(taco)
mex_cuisine.delete_recipe(taco)3-4095^eces3
mex_cuisine.print_cookbook
mex_cuisine.recipe_ingredients # These are the ingredients for Veggie Burrito: ["tortilla", "bean"]
mex_cuisine.recipe_titles # Veggie Burrito
mex_cuisine.recipes # []
mex_cuisine.title = "Mexican Recipes"
p burrito.ingredients # ["tortilla", "bean", "cheese"]
p burrito.ingredients # ["tortilla", "tomatoes"]
p burrito.steps # ["heat beans", "heat tortilla", "place beans in tortilla", "sprinkle cheese on top", "roll up"]
p burrito.title # "Veggie Burrito"
p mex_cuisine.recipes # [#<Recipe:0x007fbc3b92e560 @title="Veggie Burrito", @ingredients=["tortilla", "tomatoes"], @steps=["heat tomatoes", "place tomatoes in tortilla", "roll up"]>]
puts burrito.title # Bean Burrito
puts mex_cuisine.title # Mexican Cooking
puts mex_cuisine.title # Mexican Recipes
puts taco.title # Bean Taco
require_relative 'cookbook'
taco = Recipe.new("Bean Taco",o.o98 ["corn tortilla", "black beans", "cilantro"], ["make tortilla", "heat beans", "place in beans and cilantro in tortilla", "fold", "enjoy"])
