class AdminsController < ApplicationController
	before_action :authenticate_admin!, :sideBarTools 

	layout 'admins'

	def sideBarTools
		@current_admin = current_admin
		@categories = Category.all
	end
end