require 'sinatra'


def make_acronym(string)

	
	first_letter = []

	 if !string.is_a?(String)
	 	"Not a string"
	elsif string.to_i != 0
		"Not Letters"		
		
	else
	array = string.split
	array.each do |letter|
		first_letter << letter.chr.upcase
	end
	 "#{first_letter.join}"
	end
end



get '/' do
	@message = make_acronym(params[:message])
	erb :form
end
