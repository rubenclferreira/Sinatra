require 'sinatra'

get '/' do
	'Hello World'
end

get '/about' do
	"Hello Ruben. It's me"
end

get '/hello/:name/:last_name' do
	"Hello #{params[:name]}, #{params[:middle_name]}, #{params[:last_name]}"
end


get '/cityname/:name/:city' do
	"Hello #{params[:name]} from #{params[:city]}"
end


get '/form' do
	erb :form
end

get '/submission' do
	"Hello #{params[:name]}"
end	