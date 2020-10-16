class TwitterGetsController < ApplicationController
    def show
        user = params['id']
        twitter_v1_api_url = "https://api.twitter.com/1.1/friends/list.json?screen_name=#{user}&count=200"
        # May need '&count=200' appended to the end of url string
        headers = {
            "Authorization" => "Bearer #{ENV["TWITTER_BEARER_TOKEN"]}"
            # "Bearer" => ENV["TWITTER_BEARER_TOKEN"]
        }
        response = HTTParty.get(twitter_v1_api_url, headers: headers)
        render json: response
    end
end
