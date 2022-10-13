class LikesController < ApplicationController
    def create
        tweet = Tweet.find(params[:tweet_id])
        user = User.find_by(uid: session[:login_uid])
        
        user.like_tweets << tweet
        @count = user.like_tweets.count
        
         redirect_to '/top/main'
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        user = User.find_by(uid: session[:login_uid])
        tweet.likes.find_by(user_id: user.id).destroy
        redirect_to  '/top/main'
    end
end
