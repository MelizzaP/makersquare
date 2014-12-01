class Car
	attr_accessor :name, :speed, :distance_traveled
	def initialize(name)
		@name = name
		@speed = 0
		@distance_traveled = 0
		puts "Car #{@name} has been created."
	end

	def set_speed
		@speed = Random.new
		@speed.rand(60..80)
	end
end

class Track < Car
	attr_accessor :racers, :time, :position 
	def initialize
		@racers = []
		@time = 0
		@position = []
		puts "New track y'all"
	end

	def add_racer(racer)
		if @position != [] 
			puts "A race is in progress on this track, no new drivers can be added"
		else
			@racers << racer
			p @racers
		end
	end

	def start_race
		@racers.each {|n| n.set_speed}
		@position = [0]
		p @racers
	end

	def fast_forward
		if @time == 5
			race_over
		else
			@time +=1
			@racers.each do |racer|
				racer.distance_traveled = racer.speed*@time
				speed_up = Random.new
				racer.speed = racer.speed + speed_up(0..20)
				puts "#{@time} has elapsed"
				@racers.each{|r| puts "#{r.name} has traveled #{r.distance_traveled} miles"}
			end
		end
	end

	def race_over
		puts "Race over!"
		@racers.each {|r| puts "#{r.name} has traveled #{r.distance_traveled}"}
		position = []
	end
end

	# def start_race(name)
	# 	@speed.rand(60..80)
	# end
		# @speed = Random.new
