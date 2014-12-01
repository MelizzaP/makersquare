#Pet class exercise

class Pet
  def set_voice(pet_voice)
  	@voice = pet_voice
  end
  def speak
    Kernel.puts("#{@voice}")
  end
  def playDead
  	Kernel.puts("X_X")
  end
  def drink
  	Kernel.puts ("I <3 h2o")
  end
end

#OYO class exercise
class Game
	def play
		Kernel.puts("yay!!!!!")
	end
	def putAway
		Kernel.puts("Booooo!!!!")
	end 
	def pick_another(game_choice)
		@decision = game_choice
	end
	def playChoice
		Kernel.puts("You're right playing #{@decision} would be more fun.")
	end
end

#Instance Variables
class Marker
  def set_color(my_color)
    @color = my_color
  end

  def write
    Kernel.puts("I am writing with a #{@color} marker!")
  end
end

# Extentions exercise
5.send(:*, 5) #=> 25
"omg".send(:upcase) #=> "OMG"
['a', 'b', 'c'].send(:at,1) #=> "b"
['a', 'b', 'c'].send(:insert, 2, 'o', 'h', 'n', 'o') #=>["a", "b", "o", "h", "n", "o", "c"]
{}.send(:size) #=> 0
{character: "Mario"}.send(:has_key?, :character) #=> true

6-32 #=> -26
{html: true, json: false}.keys #=> [:html, :json]
"MakerSquare"*6 #=> "MakerSquareMakerSquareMakerSquareMakerSquareMakerSquareMakerSquare"
"MakerSquare".split('a') #=> ["M", "kerSqu", "re"]
['aplha', 'beta'].[](3) #=> nil

