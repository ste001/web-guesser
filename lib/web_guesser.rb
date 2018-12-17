require 'sinatra'
require 'sinatra/reloader'

def generate_random_number
  rand(100)
end

random_number = generate_random_number

get '/' do
  "The SECRET NUMBER is #{random_number}"
end