class TwitterGetsController < ApplicationController
    def show
        user_and_cursor = params['id']
        # twitter_v1_api_url = "https://api.twitter.com/1.1/friends/list.json?screen_name=#{user_and_cursor}&count=100" #old
        twitter_v1_api_url = "https://api.twitter.com/1.1/friends/list.json?screen_name=#{user_and_cursor}&skip_status=true&include_user_entities=false" #new
        # '&cursor=-1' to atrt and then repeat until cursor = 0
        headers = {
            "Content-type" => "application/json",
            "Authorization" => "Bearer #{ENV["TWITTER_BEARER_TOKEN"]}"
        }
        response = HTTParty.get(twitter_v1_api_url, headers: headers)
        render json: response
    end
end
