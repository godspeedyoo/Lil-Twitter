require 'spec_helper'

describe "Tweet shit" do
  describe "get /tweets" do
    it "displays tweets" do
      get '/tweets'
      expect(last_response.status).to eq(200)
    end
  end

end
