# require 'json'

get '/tweets' do
  @current_user = User.find(session[:id])
  @tweets = Tweet.all
  @users = User.all
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
  user = User.find(session[:id])
  tweet = Tweet.find(params[:id])
  user.tweets.create( user_id: user.id,
                      content: tweet.content,
                      created_at: tweet.created_at,
                      updated_at: Time.now,
                      original_user_id: tweet.user_id)
  # @tweet.update_attributes(:)
  redirect '/tweets'
end

delete '/tweets/:id' do
  tweet = Tweet.find(params[:id])
  tweet.destroy
  redirect '/tweets'
end


# instantiate a new thing of that resource with the data passed in
# if it saves properly then redirect to somewhere
# if it fails rerender where you came from
