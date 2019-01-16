require "sinatra"
require "sinatra/reloader"

X = rand(99)

get "/" do
  "The secret number is #{X}"
end

