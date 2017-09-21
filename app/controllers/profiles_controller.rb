class ProfilesController < ApplicationController
	def index
		@allprofile = User.all
	end	
end