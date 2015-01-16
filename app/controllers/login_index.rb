get '/' do
  @user = User.new
  erb :index
end

get '/login' do
  erb :"/login/index"
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user != nil && @user.password == params[:password]
    session[:id] = @user.id
    redirect '/profile'
  else
    redirect '/'
  end
end

get '/signup' do
  @user = User.new
  erb :"/signup/sign_up_forms"
end

post '/signup' do
  @user = User.new(
      username: params[:username],
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password])
  if @user.save
    redirect '/profile'
  else
    #redisplay the form!!!
    erb :"/signup/sign_up_forms"
  end
end

get '/profile' do
  #if a user is logged in
  if session[:id] != nil
    @user = User.find(session[:id])
    # check the session to see if there is an id there
  #render something
    erb :'/profile/index'
  else
    redirect '/login'
  end
end
