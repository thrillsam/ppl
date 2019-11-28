class Api::LogoController < Api::BaseController
	def create
		@current_user.team.logo.attach(params[:logo])
		render json: 'uploaded successfully', status: 200
	end
	
	def show
		render json: @current_user.team.logo.service_url rescue nil
	end
end
