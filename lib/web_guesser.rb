require 'sinatra'
require 'sinatra/reloader'

set :root, '../'

random_number = rand(100)

get '/' do
  erb :index, :locals => {:random_number => random_number}
end