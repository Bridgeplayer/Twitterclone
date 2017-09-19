class TweetsController < ApplicationController

  	before_action :find_tweet, only: [:edit, :show, :update, :destroy]

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

		if @twee.save
			flash[:success] = "Bookrecord successfully created"
			redirect_to tweets_path
		else
			flash.now[:failure] = "Bookrecord not successfully created"
			render "new"
		end
	end


	private
	def post_params
		params.require(:tweet).permit(:post)
	end
end