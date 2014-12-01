require_relative 'race_car'


green_racer = Car.new("Green Machine")
red_racer = Car.new("Red Fire")

cool_track = Track.new

cool_track.add_racer(green_racer)
puts "first add"
cool_track.add_racer(red_racer)
puts "red add"

cool_track.start_race

cool_track.fast_forward

cool_track.add_racer("green_racer")
