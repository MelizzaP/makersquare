require 'sinatra'
require 'pig_latin'

set :bind, '0.0.0.0'

get '/translate' do
  @text = params[:text]
  erb :translate
end

post '/translate' do
  erb :result
end