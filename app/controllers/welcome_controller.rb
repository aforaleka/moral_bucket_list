class WelcomeController < ApplicationController
	before_action :authenticate_user!, only: [:dash]

	def index
		
	end

	def dash

	end

end