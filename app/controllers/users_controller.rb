class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		
		if @user == current_user
			redirect_to profile_path
		end

		@virtues = @user.virtues.where(:public => true)
	end

	def profile
		@user = current_user
		@virtues = @user.virtues
	end

	


end
