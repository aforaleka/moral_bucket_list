class EventsController < ApplicationController
	

	def friends
		@friends = current_user.all_following
		@events = get_followed_events(@friends)
		@events = @events.sort_by{ |event| event.created_at}.reverse
	end

	def public
		@events = Event.all.order(created_at: :desc)
	end

	private

	def get_followed_events(friends)
		friend_events = Array.new
		if (friends.count == 0)
			return friend_events
		else
			friends.each do |f|
				f.events.each do |event|
					friend_events << event 
				end
			end
			return friend_events
		end
	end



end