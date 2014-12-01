require 'rest-client'
response = RestClient.get("critics.api.mks.io/restaurants")
response2 = RestClient.get("critics.api.mks.io/movie-genres")
response3 = RestClient.get("critics.api.mks.io/cheeses")

ratings = JSON.parse(response)
movies = JSON.parse(response2)
cheeses = JSON.parse(response3)

def top_rated(ratings)
  top = ratings.select {|r| r["rating"].to_i > 7}
  top.sort_by! {|k| k["rating"].to_i}.reverse!

  top.each {|x| puts "#{x["rating"]} - #{x["venue"]}"}
end

def austin(ratings)
  location = ratings.select {|v| v["venue"].match(/Austin/i)}
  puts "Austin Restaurants"
  location.each{|v| puts v["venue"]}
end

def popular_genres(movies)
  popular = []
  count = Hash.new(0)
  genres.each{|x| popular << x["genre"]}
  popular.each {|x| count[x] +=1}
  hash2 = Hash[count.sort_by {|k,v| -v}[0..2]]
  puts "Popular movie genres:"
  hash2.each {|k,v| puts "#{k} - #{v} reviews"}
end

# top_genres method takes entire API response
def top_genres(movies)
 # this line grabs all the genre names from the response and puts
 # them into a unique array
 genres = movies.map{|x| x["genre"]}.uniq

 # here is were a lot of stuff happens.....
 averages = genres.map do |x|
   # we grab all the genres of a given name ('x') and put them in an array
   rating = movies.select {|y| y["genre"] == x}

   # we then grab the ratings of each of the reviews we found in the previous step
   scores = rating.map { |z| z["rating"].to_i }

   # here is where we add up those ratings
   average = scores.inject(:+) / rating.size

   # and then this line builds an array that looks something like this:
   #  ['Action', 10] # where 'Action' is the genre name and 10 is the average rating
   [x, average]
 end
 # here we sort the array of arrays by the last element (the average score)
 # and return the last 3 since the array will be sorted in ascending order
 sorted_genres = averages.sort_by { |x| x.last }.last(3)

 # and this line returns an array with just the top 3 genre names
 sorted_genres.map { |x| x.first }
end

def print_cheese(cheeses)
  cheeses.each{|x| puts "#{x['cheese']}: #{x["comment"]}. --#{x["reviewer"]}"}
end
print_cheese(cheeses)

# p top_genres(movies)


# top_rated(ratings)
# austin(ratings)
# popular_genres(genres)
