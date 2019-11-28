class Api::UsersController < Api::BaseController 
  
  def create
  	User.create(user_params)
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, :team_id)
  	end
end

