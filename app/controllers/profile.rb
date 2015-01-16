
get '/profile' do
  if session[:id] != nil
    @user = User.find(session[:id])

    erb :'/profile/index'
  else
    redirect '/login'
  end
end

get '/profile/:id' do
  @user = User.find(params[:id])
  erb :'/profile/index'
end
