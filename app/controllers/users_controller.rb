class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@virtues = @user.virtues
	end

	


end
