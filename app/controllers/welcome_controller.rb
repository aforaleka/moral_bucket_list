class WelcomeController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index]

	def index
		@items = Item.where(:public => true:).order(created_at: :desc)
	end

	def dash

	end

end