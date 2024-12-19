class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :validatable, :confirmable, :two_factor_authenticatable

  def self.validate_and_consume_and_set_otp!(otp_code, oauth2_session)
    if self.validate_and_consume_otp!(otp_code)
      oauth2_session.otp_validated = true
      oauth2_session.save!
      render json: { success: true, valid: true }
    else
      render json: { success:true, valid: false }
    end
  end
end
