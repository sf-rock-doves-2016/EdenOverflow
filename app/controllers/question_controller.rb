get '/questions' do
  @questions = Question.all
  @sorted_questions = sort_ratings(@questions)
  @sorted_questions_comments = sort_comments(@questions)
  @newest_questions = sort_newest(@questions)
	erb :'questions/index'
end


get '/questions/new' do
	erb :'questions/new'
end

post '/questions' do
	question = Question.new(params[:question])
	question.save
	if question.save
		redirect '/questions'
	end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @author = User.find(@question.user_id)
  erb :'questions/show'
end

get '/questions/:id/comments/new' do
  @type = "Question"
  @id = params[:id]
  if request.xhr?
    return erb :_comment_form, layout: false, locals: {id: @id, type: @type}
    # return "Hello"
  else
  erb :'comments/new'
end
end

get '/answers/:id/comments/new' do
  @type = "Answer"
  @id = params[:id]
  erb :'comments/new'
end
