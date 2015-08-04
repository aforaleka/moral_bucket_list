class EventsController < ApplicationController
	

	def friends

	end

	def public
		@events = Event.all.order(created_at: :desc)
	end



end