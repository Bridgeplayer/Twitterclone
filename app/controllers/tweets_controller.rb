class TweetsController < ApplicationController

	def index
		@twee = Tweet.all
		@lik = Like.all
	end

end