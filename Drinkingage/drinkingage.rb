require 'sinatra'

def drinkingage(age)
	
	if age.empty?
		"Error, please insert your age"

	elsif age.to_i < 18
		"Not allowed to drink"

	else
		 "Allowed to drink"
	end	
end

get "/" do
	erb :form
end

get "/ageresponse" do
	@ageresponse = drinkingage(params[:age])

end