class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])

		if @user == current_user
			redirect_to profile_path
		end
		@is_owner = false
		@acts = @user.acts.where(:completed => true)
		@karma_points = karma_count(@acts)
	end

	def profile
		@is_owner = true
		@user = current_user
		@acts = @user.acts.where(:completed => true)
		@karma_points = karma_count(@acts)
	end

	def to_do
		@user = User.find(params[:id])
		if (@user == current_user)
			@is_owner = true
		else
			@is_owner = false
		end
		
		@acts = @user.acts.where(:completed => false)
	end

	def follow
	end

	def unfollow
	end
	
	private
	def karma_count(acts)
		points = 0
		acts.each do |act|
			points = points + act.karma_points
		end

		return points
	end



end
