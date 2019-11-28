class Api::SessionsController < Api::BaseController
  skip_before_filter :authenticate_user!, only: :create

  def create
   result = AuthenticateUser.new(params[:email], params[:password]).call

   if result.present?
     render json: { token: result[0], color: result[1], logo: result[2] }, status: 200
   else
     render json: { error: 'Invalid Credentials' }, status: :unauthorized
   end
  end
  
  
  def destroy
    render json: {message: "success"}, status: 200
  end
end
