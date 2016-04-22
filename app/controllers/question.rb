get '/questions' do 
	@questions = Question.all
	erb :index
end

get '/questions/:id' do 
	":D"
end

