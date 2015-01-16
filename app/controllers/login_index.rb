get '/' do
  @user = User.new
  erb :index
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user != nil && @user.password == params[:password]
    session[:id] = @user.id
    redirect '/secrets'
  else
    redirect '/'
  end
end

get '/signup' do
  erb :sign_up_forms
end

post '/signup' do
  @user = User.new(
      username: params[:username],
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password])
  if @user.save
    redirect '/secrets'
  else
    #redisplay the form!!!
    # @user.errors.full_message
     erb :sign_up_forms
  end
end

get '/secrets' do
  #if a user is logged in
  if session[:id] != nil
    # check the session to see if there is an id there
  #render something
  "Success"
  else
    redirect '/login'
  end
end

# get '/login' do
#   # click on something then
#   "hello world"
#   # erb ':index/login'
# end

# post '/login' do
#   User.create(params)

# end
