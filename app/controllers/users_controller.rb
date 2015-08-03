class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])

		if @user == current_user
			redirect_to profile_path
		end
		@is_owner = false
		@acts = @user.acts
	end

	def profile
		@is_owner = true
		@user = current_user
		@acts = @user.acts
	end

	


end
