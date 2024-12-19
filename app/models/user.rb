class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :validatable, :confirmable, :two_factor_authenticatable

  def validate_and_consume_and_set_otp!(otp_code, session_id)
    if self.validate_and_consume_otp!(otp_code)
      oauth_session = Oauth2::Session.find_by(id: Integer(session_id))
      oauth_session.update(otp_validated: true)
      return true
    else
      return false
    end
  end
end
