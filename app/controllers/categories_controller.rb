class ApplicationController < ActionController::Base
  def show
  	@category = Category.find(params[:id])
  end
end
