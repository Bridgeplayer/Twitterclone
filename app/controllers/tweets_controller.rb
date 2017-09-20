class TweetsController < ApplicationController

  	# before_action :find_tweet, only: [:edit, :show, :update, :destroy]

  	def find_tweet
		@twee = Tweet.find(params[:id])
  	end

	def index
		@twee = Tweet.all
		@lik = Like.all
	end

	def new
		@twee = Tweet.new
	end

	def create
		# post_params = params[:tweet].permit(:post)
		@twee = Tweet.new(post_params)
		@twee.user_id = current_user.id

		if @twee.save
			flash[:success] = "Bookrecord successfully created"
			redirect_to tweets_path
		else
			flash.now[:failure] = "Bookrecord not successfully created"
			render "new"
		end
	end

	def show
		@twee = Tweet.find(params[:id])
		@repli = Reply.new
		# @replii = Reply.find(params[:tweet_id])

	end

	def edit
		@twee = Tweet.find(params[:id])
	end

	def update
		# post_params = params.require(:tweet).permit(:post)
		@twee = Tweet.find(params[:id])
		if @twee.update(post_params)
			flash[:success] = "Bookrecord successfully updated"
			redirect_to tweets_path
		else
			flash.now[:failure] = "Bookrecord not successfully updated"
			render "edit"
		end

	end

	def destroy
		@twee = Tweet.find(params[:id])
		if @twee.destroy
			flash[:success] = "Bookrecord successfully destroyed"
			redirect_to tweets_path
		else
			flash.now[:failure] = "Bookrecord not successfully destroyed"
			redirect_to tweets_path
		end
	end

	private
	def post_params
		params.require(:tweet).permit(:post)
	end
end