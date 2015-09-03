class EpicenterController < ApplicationController
  def feed
  
     #initialize the array that will hold tweets
     #from the current_user's following list.
     @following_tweets = []
     #pull in all the tweets
     @tweets = Tweet.all
     @users = User.all

     @follower_count = 0
     #then we sort through the tweets
     #find the ones associated with users from
     #current_user's following array
     if user_signed_in?
          @tweets.each do |tweet|
              current_user.following.each do |f|
                  if tweet.user_id == f
                      @following_tweets.push(tweet)
                  #those tweets are pushed into the
                  #array we called in the view
                  end
              end
          end
          @users.each do |user|
              if user.following.include?(current_user.id)
                  @follower_count += 1
              end
          end
     else
        redirect_to new_user_session_path
     end
  
  end

  def show_user
  end

  def now_following
  end

  def unfollow
  end
end
