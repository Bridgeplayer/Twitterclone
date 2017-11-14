class FollowingsController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		@followin = Following.new
		@followin.follower_id = current_user.id
		@followin.leader_id = @user.id
		@followin.save
		# redirect_to tweets_path

		respond_to do |format|
			format.html {redirect_to tweets_path}
			format.js { render :create }
		end


	end

	def destroy
		@followin = Following.find(params[:id])
		@followin.destroy
		# redirect_to tweets_path

		@user = User.find(params[:user_id])

		respond_to do |format|
			format.html {redirect_to tweets_path}

			format.js { render :destroy }
		end
	end

end