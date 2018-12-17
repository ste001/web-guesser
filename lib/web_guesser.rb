require 'sinatra'
require 'sinatra/reloader'

set :root, '../'

random_number = rand(100)

def feedback random, guess
  return "Way too high!" if (guess > random + 5)
  return "Way too low!" if (guess < random - 5)
  return "Too high!" if (guess > random)
  return "Too low!" if (guess < random)
  "You got it right!"
end

get '/' do
  message = feedback(random_number, params["guess"].to_i)
  erb :index, :locals => {:random_number => random_number, :message => message}
end