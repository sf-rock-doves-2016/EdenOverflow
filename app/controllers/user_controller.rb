#new user request
get '/users/new' do
	erb :'/users/user_new'
end

#create new user
post '/users' do
	new_user = User.new(username: params[:username], email: params[:email], password: params[:password])

	if new_user.valid?
		new_user.save
		session[:user_id] = new_user.id
		session[:success] = "Account successfully created"
		redirect '/'
	else
		session[:errors] = "You need a unique email and password to join Eden Overflow"
		redirect '/users/new'
	end
end

#show a user
get '/users/:id' do
	if session[:user_id] != params[:id].to_i
    session[:errors] = "You must login to access this page"
    redirect '/'
  end
  @user = User.find(params[:id])
  if @user
    erb :'/users/user_index'
  else
    session[:errors] = @user.errors.full_messages[0]
    redirect '/'
  end
end

#get edit page
# get '/users/:id/edit' do
# 	@user = User.find(params[:id])
# 	erb :'/users/user_edit'
# end

#submit user edit
# put '/users/:id' do
# 	user = User.find(params[:id])
# 	user.username = params[:username]
# 	user.email = params[:email]
# 	if user.save
# 		redirect '/'
# 	else
# 		# flash[:errors] = user.errors.full_messages
# 		redirect "/users/#{current_user.id}/edit"
# 	end
# end

#delete user
delete '/users/:id/delete' do
  user = User.find(params[:id])
  user.destroy
  session.clear
  redirect '/'
end


