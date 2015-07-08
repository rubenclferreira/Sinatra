require 'sinatra'

parties = [
  ...
]

get '/' do
  @parties = #
  erb :index
end

get '/new do
  erb :form
end

get '/create do
  parties << Party.new ... 
  redirect '/'
end