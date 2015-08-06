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
		@friends = @user.followers
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
			flash[:alert] = "You cannot friend yourself!"
		elsif current_user.following?(@user)
			flash[:alert] = "You already friend this person!"
		else 
			current_user.follow(@user)
			flash[:notice] = "Successfully friended #{@user.name}!"
		end

		redirect_to user_path(@user)

	end

	def unfollow
		@user = User.find(params[:id])
		if current_user == @user
			flash[:alert] = "Invalid Action!"
		elsif !current_user.following?(@user)
			flash[:alert] = "You are not friends with this person!"
		else 
			current_user.stop_following(@user)
			flash[:notice] = "Successfully unfriended #{@user.name}!"
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
