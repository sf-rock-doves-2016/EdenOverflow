post '/votes' do 
	Vote.create(params[:vote])
end