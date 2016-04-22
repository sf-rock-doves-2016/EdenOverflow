get '/questions' do
	@questions = Question.all
	erb :'questions/index'
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	@author = User.find(@question.id)
	erb :'questions/show'
end

get '/questions/:id/comments/new' do
  @type = "Question"
  @id = params[:id]
  erb :'comments/new'
end

get '/answers/:id/comments/new' do
  @type = "Answer"
  @id = params[:id]
  erb :'comments/new'
end