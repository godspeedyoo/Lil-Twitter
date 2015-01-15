require 'spec_helper'

describe "Tweet shit" do
  describe "get /tweets" do
    it "displays tweets" do
      get '/tweets'
      expect(last_response.status).to eq(200)
    end
  end

  describe "post /tweets" do
    it "creates a new tweet" do
      expect {
        post '/tweets', {content: "extra shit"}
      }.to change {
        Tweet.count
      }.by(1)
    end
  end

  pending "post /tweets/:id/retweet" do
    it "" do
    end
  end
end
