post '/answers' do 
	answer = Answer.create(params[:answer])
end