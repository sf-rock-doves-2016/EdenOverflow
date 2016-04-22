post '/comments' do
  Comment.create(params[comment])
end