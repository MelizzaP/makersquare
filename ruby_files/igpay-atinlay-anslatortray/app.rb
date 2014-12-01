require 'sinatra'
require 'pig_latin'

set :bind, '0.0.0.0'

get '/translate' do
  erb :translate
end

post '/result' do
  @word = params[:word]
  erb :result, layout: :layout
end