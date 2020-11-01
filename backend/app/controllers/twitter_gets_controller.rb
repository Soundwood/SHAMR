class TwitterGetsController < ApplicationController
    def show
        user = params['id']
        twitter_v1_api_url = "https://api.twitter.com/1.1/friends/list.json?screen_name=#{user}&count=100"
        # '&cursor=-1' to atrt and then repeat until cursor = 0
        headers = {
            "Authorization" => "Bearer #{ENV["TWITTER_BEARER_TOKEN"]}"
        }
        response = HTTParty.get(twitter_v1_api_url, headers: headers)
        render json: response
    end
end
