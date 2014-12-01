require 'rubygems'
require 'sinatra'
require 'pry-byebug'

set :bind, '0.0.0.0' # for Vagrant

get '/welcome' do
  erb :welcome # This will look for a file called 'views/welcome.erb'
end

post '/name' do
  @name = params[:name]
  erb :name
end

get '/say' do
  erb :say
end

post '/said' do
  @name = params[:name]
  @talk = params[:talk]
  erb :said
end 

get '/dog-registration' do
  erb :dog_registration
end

get '/dog-registration-results' do
  @name = params[:name]
  @breed = params[:breed]
  @color = params[:color]
  @mean = params[:mean]
  @gender = params[:gender]
  erb :dog_registration_results
end
