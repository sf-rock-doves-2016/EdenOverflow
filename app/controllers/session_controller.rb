post '/sessions' do
  access = User.authenticate(params[:email], params[:password])
  if access
    puts User.find_by(email: params[:email]).id
    session[:user_id] = User.find_by(email: params[:email]).id
    session[:success] = "Successfully Logged In"
    puts session[:user_id]
    redirect "/users/#{session[:user_id]}"
  else
    session[:errors] = "Email or password do not match records"
    redirect '/'
  end
end

get '/sessions/logout' do
  session.clear
  session[:success] = "You have successfully logged out"
  redirect '/'
end


# #create new session page
# get '/login' do
# 	erb :'/sessions/session_new'
# end


# #login to session
# post '/sessions' do
# 	user = User.find_by(email: params[:email])
# 	if user && user.password = params[:password]
# 		session[:id] = user.id
# 		redirect '/'
# 	else
# 		# flash[:errors] = ['Incorrect Username or Password']
# 		status 400
# 		redirect '/login'
# 	end
# end


# #delete session
# delete '/sessions/:id' do
# 	current_user = nil
# 	session[:id] = nil
# 	redirect '/templates'
# end


