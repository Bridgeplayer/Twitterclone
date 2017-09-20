class RepliesController < ApplicationController

	def create
		@twee = Tweet.find(params[:tweet_id])
		repli_params = params.require(:reply).permit(:post)
		@repli = @twee.replies.build(repli_params)
		@repli.user_id = current_user.id
		@repli.tweet_id = @twee.id
		if @repli.save
			flash[:notice] = "Replied Successfully"
			redirect_to tweet_path(id: @twee.id)
		else
			flash.now[:notice] = "Unsuccessful, please check your input"
			render 'tweets/show'
		end
	end


end