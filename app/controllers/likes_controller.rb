class LikesController < ApplicationController

	def create
		@twee = Tweet.find(params[:tweet_id])
		@lik = Like.new
		@lik.user_id = current_user.id
		@lik.tweet_id = @twee.id

		if @lik.save
			redirect_to tweet_path(id: @twee.id)
		end
	end

	def destroy
		@twee = Tweet.find(params[:tweet_id])
		@lik = Like.find(params[:id])
		if @lik.destroy
			redirect_to tweet_path(id: @twee.id)
		end
	end

end