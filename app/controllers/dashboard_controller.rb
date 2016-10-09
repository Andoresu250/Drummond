class DashboardController < ApplicationController
	#before_action :authenticate_admin!, only: [:index,:edit,:activar,:desactivar,:update,:destroy]
	before_action :authenticate_user!
 	def index
  	end
end