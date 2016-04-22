post '/answers' do
	answer = Answer.new(params[:answer])
  if answer.save
    redirect "/questions/#{params[:answer][:question_id]}"
  else
    @question = Question.find(params[:answer][:question_id])
    @author = User.find(@question.user_id)
    @errors = "Didn't save"
    erb :'questions/show'
  end
end