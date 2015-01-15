get '/tweets' do
  @tweets = Tweet.all
  erb :'tweets/index'
end

get '/tweets/new' do
  erb :'tweets/new'
end

post '/tweets' do
  user = User.first
  tweet = user.tweets.create(params[:tweet])
  redirect '/tweets'
end
