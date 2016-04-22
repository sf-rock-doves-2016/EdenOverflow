post '/comments' do
  comment = Comment.create(params[:comment])
  if comment.commentable_type == "Question"
    redirect "/questions/#{comment.commentable_id}"
  else
    question = Answer.find(comment.commentable_id).question
    redirect "/questions/#{question.id}"
  end
end