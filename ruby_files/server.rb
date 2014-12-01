require 'sinatra'

set :bind, '0.0.0.0' # This is needed for Vagrant

get '/hello' do
  "Hello friends"
end