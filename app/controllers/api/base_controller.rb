class Api::BaseController < ApplicationController
  respond_to :json
  before_action :authenticate_user!

  def authenticate_user!
 	header = request.headers['HTTP_TOKEN']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
      # @favourite_team = Team.find(@decoded[:team_id])
      # @team_color = @favourite_team.color
      # @team_logo  = @favourite_team.logo.service_url rescue nil
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
