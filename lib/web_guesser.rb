require 'sinatra'
require 'sinatra/reloader'

set :root, '../'
set :random_number, rand(100)

@@remaining_guesses = 5

def feedback random, guess
  return "You lost! A new number has been generated." if (@@remaining_guesses == 0)
  return "Way too high!" if (guess > random + 5)
  return "Way too low!" if (guess < random - 5)
  return "Too high!" if (guess > random)
  return "Too low!" if (guess < random)
  "You got it right!"
end

get '/' do
  @@remaining_guesses -= 1
  message = feedback(settings.random_number, params["guess"].to_i)
  if (@@remaining_guesses == 0 || message == "You got it right!")
    settings.random_number = rand(100)
    @@remaining_guesses = 5
  end
  erb :index, :locals => {:random_number => settings.random_number,\
     :message => message, :remaining_guesses => @@remaining_guesses,\
    :cheat => params["cheat"]}
end