post '/votes' do
	vote = Vote.create(params[:vote])
  if vote.votable_type == "Question"
    redirect "/questions/#{vote.votable_id}"
  else
    question = Answer.find(vote.votable_id).question
    redirect "/questions/#{question.id}"
  end
end
