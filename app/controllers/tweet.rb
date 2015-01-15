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
  # display errors conditionally
  redirect '/tweets'
end

post '/tweets/:id/retweet' do

end
# user = User.find(session[:user_id])

delete '/tweets/:id' do
  tweet = Tweet.find(params[:id])
  tweet.destroy
  redirect '/tweets'
end
