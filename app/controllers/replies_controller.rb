class RepliesController < ApplicationController

	def create
		@twee = Tweet.find_by(id: params[:id])
		repli_params = params.require(:repli).permit(:post)
		@repli = @twee.replies.build(repli_params)
		@repli.user_id = current_user.id
		if @repli.save
			flash[:notice] = "Commented Successfully"
			redirect_to tweet_path(id: @twee.id)
		else
			flash.now[:notice] = "Unsuccessful, please check your input"
			render 'tweets/show'
		end
	end


end