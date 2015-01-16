put "/follow/:id" do

  Subscription.find_or_create_by(following_id: params[:id], follower_id: session[:id])
  redirect "/profile/#{params[:id]}"
end
