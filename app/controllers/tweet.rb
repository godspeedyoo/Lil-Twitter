# require 'json'

get '/tweets' do
  @tweets = Tweet.all
  p "*"*50
  p @tweets
  erb :'tweets/index'
end

get '/tweets/new' do
  @tweet = Tweet.new
  erb :'tweets/new'
end

post '/tweets' do
  @user = User.find(session[:id])
  @tweet = @user.tweets.new(:content => params[:tweet][:content])
  # display errors conditionally
  if @tweet.save
    redirect '/tweets'
  else
    erb :'tweets/new'
  end
end

post '/tweets/:id/retweet' do
  @tweet = Tweet.find(params[:id])
  # @tweet.update_attributes(:)
end

delete '/tweets/:id' do
  tweet = Tweet.find(params[:id])
  tweet.destroy
  redirect '/tweets'
end


# instantiate a new thing of that resource with the data passed in
# if it saves properly then redirect to somewhere
# if it fails rerender where you came from
