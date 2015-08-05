class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])

		if @user == current_user
			@is_owner = true
		else
			@is_owner = false
		end

		@to_do = @user.acts.where(:completed => false)
		@acts = @user.acts.where(:completed => true)
		
		@karma_points = karma_count(@acts)
	end

	def profile
		@is_owner = true
		@user = current_user
		@acts = @user.acts.where(:completed => true)
		@to_do = @user.acts.where(:completed => false)
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
		@user = User.find(params[:id])
		if current_user == @user
			flash[:alert] = "You cannot follow yourself!"
		elsif current_user.following?(@user)
			flash[:alert] = "You already follow this person!"
		else 
			current_user.follow(@user)
			flash[:notice] = "Successfully followed #{@user.name}!"
		end

		redirect_to user_path(@user)

	end

	def unfollow
		@user = User.find(params[:id])
		if current_user == @user
			flash[:alert] = "Invalid Action!"
		elsif !current_user.following?(@user)
			flash[:alert] = "You do not follow this person!"
		else 
			current_user.stop_following(@user)
			flash[:notice] = "Successfully unfollowed #{@user.name}!"
		end
		redirect_to user_path(@user)
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
