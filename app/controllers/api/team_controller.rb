class Api::TeamController < Api::BaseController 
  def index
  	render json: Team.all
  end
end
