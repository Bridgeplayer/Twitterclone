class TweetsController < ApplicationController

  	# before_action :find_tweet, only: [:edit, :show, :update, :destroy]

  	def find_tweet
		@twee = Tweet.find(params[:id])
  	end

	def index
		@user = current_user
		@twee = Tweet.all
		@lik = Like.all
		@user = current_user
		@leadercount = @user.leaders.count
		@followercount = @user.followers.count
	end

	def new
		@twee = Tweet.new
	end

	def create
		# post_params = params[:tweet].permit(:post)
		@twee = Tweet.new(post_params)
		@twee.user_id = current_user.id

		if @twee.save
			flash[:notice] = "Tweet successfully created"
			redirect_to tweets_path
		else
			flash.now[:notice] = "Tweet not successfully created"
			render "new"
		end
	end

	def show
		@twee = Tweet.find(params[:id])
		@repli = Reply.new
		
		@lik = Like.find_by(user_id: current_user.id, tweet_id: @twee.id)
		@likcount = Like.where(tweet_id: @twee.id).count
	

	end

	def edit
		@twee = Tweet.find(params[:id])
	end

	def update
		# post_params = params.require(:tweet).permit(:post)
		@twee = Tweet.find(params[:id])
		if @twee.update(post_params)
			flash[:notice] = "Tweet successfully updated"
			redirect_to tweets_path
		else
			flash.now[:notice] = "Tweet not successfully updated"
			render "edit"
		end

	end

	def destroy
		@twee = Tweet.find(params[:id])
		if @twee.destroy
			flash[:notice] = "Tweet successfully destroyed"
			redirect_to tweets_path
		else
			flash.now[:notice] = "Tweet not successfully destroyed"
			redirect_to tweets_path
		end
	end

	private
	def post_params
		params.require(:tweet).permit(:post)
	end
end