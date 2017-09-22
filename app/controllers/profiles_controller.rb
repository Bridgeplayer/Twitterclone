class ProfilesController < ApplicationController
	def follower
		@allprofile = User.all
		@user = current_user
	end	

	def leader
		@allprofile = User.all
		@user = current_user
	end

end