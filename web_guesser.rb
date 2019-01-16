require "sinatra"
require "sinatra/reloader"

NUM = rand(100)+1

def check_guess(guessing)
  guessed = guessing.to_i
  message = ""
  if guessed <= 0
    message = ""
  elsif guessed - 5 > NUM
    message = "Way too high!"
  elsif guessed > NUM
    message = "Too high!"
  elsif guessed + 5 < NUM
    message = "Way too low!"
  elsif guessed < NUM
    message = "Too low!"
  else
    message = "You got it right!"
  end
  return message
end

get "/" do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => { :number => NUM, :message => message, :guessed => guess.to_i }
end
