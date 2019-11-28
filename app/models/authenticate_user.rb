class AuthenticateUser

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    token = JsonWebToken.encode(user_id: user.id, team_id: user.team.id) 
    [token, user.team.color, user.team.logo.service_url] if user
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)
    nil
  end
end