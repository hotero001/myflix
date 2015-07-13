class ApplicationController < ActionController::Base
	def index
		@videos = Video.all
		@categories = Category.all
	end

	def show
		@video = Video.first
	end
end
