# rec = File.open('recipes.txt')
# array = []
# rec.each_line{|x|array << x}

# data = File.read('recipes.txt')
# strings = data.split("\n\n")
# strings.maps{|x| x.split("\n")}




# # class List

#   def initialize
#     rec.each do |x|
#       if x[0
#     recipes = [{name:"", serving_size:0, ingredients:[{name:"", amnt:1, unit_of_measure:"Whole"}]]
#   end
class Parser

  def build_ingredient_hash(string)
    units = ["oz","lbs","tbs","cup"]
    amount = string.to_f
    split = string.split

    if amount.zero?
      {name: string, units:"", amount:""}
    elsif units.include?(split[1])
      {name: split[2..-1].join(" "), units: split[1], amount: amount}
    else
      {name:split[1..-1].join(" "), units:"", amount:amount}
    end

  end

  def recipe_parser(file_name)
    data = File.read(file_name)
    recipes = data.split("\n\n")
    recipes.map!{|x| x.split("\n")} #array of arrays

    cookbook = []

    recipes.map do |recipe|
      title = recipe.first
      servings = recipe[1].split.last.to_i
      ingredients = recipe[2..-1]

      ingriendts.map! do |ingredient|
        build_ingriedient_hash(ing)
      end

      {
        title: title,
        servings: servings,
        ingredients:ingredients
      }
    end
  end
end