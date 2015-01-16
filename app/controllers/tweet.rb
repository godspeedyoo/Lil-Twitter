# require 'json'

get '/tweets' do
  @tweets = Tweet.all
  erb :'tweets/index'
end

get '/tweets/new' do
  @tweet = Tweet.new
  erb :'tweets/new'
end

post '/tweets' do
  @user = User.first
  @tweet = @user.tweets.new(:content => params[:tweet][:content])
  # display errors conditionally
  if @tweet.save
    redirect '/tweets'
  else
    erb :'tweets/new'
  end
end

post '/tweets/:id/retweet' do

end
# user = User.find(session[:user_id])

delete '/tweets/:id' do
  tweet = Tweet.find(params[:id])
  tweet.destroy
  redirect '/tweets'
end


# instantiate a new thing of that resource with the data passed in
# if it saves properly then redirect to somewhere
# if it fails rerender where you came from
