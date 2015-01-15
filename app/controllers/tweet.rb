get '/tweets' do
  @tweets = Tweet.all
  erb :'tweets/index'
end

post '/tweets' do
  p params
  @user = User.create(username: "One")
  @tweet = @user.tweets.create(params)
end
