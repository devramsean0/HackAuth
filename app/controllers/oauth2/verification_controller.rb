class Oauth2::VerificationController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:validate] # This is just a normal API endpoint. And is therefore safe to skip CSRF protection.
  def edit
    if current_user.verification_enabled
      if !current_user.otp_secret || params[:force_qr]
        current_user.otp_secret = User.generate_otp_secret
        current_user.save!
        issuer = 'HackAuth'
        label = "#{current_user.email}"
        provisioning_uri = current_user.otp_provisioning_uri(label, issuer: issuer)
        qrcode = RQRCode::QRCode.new(provisioning_uri)
        @svg = qrcode.as_svg(
          color: "000",
          shape_rendering: "crispEdges",
          module_size: 3,
          use_path: true,
        )
        render "configure_verification"
      end
    end
  end
  
  def validate
    if current_user.validate_and_consume_and_set_otp!(params[:otp_code], session[:oauth_session_id])
      render json: { success: true, valid: true }
    else
      render json: { success:true, valid: false }
    end
  end

  def redirect
    oauth_session = Oauth2::Session.find_by(id: Integer(session[:oauth_session_id]))
    redirect_uri = "#{oauth_session.redirect_uri}?code=#{oauth_session.code}"
    if oauth_session.otp_validated
      # TODO: Redirect to url
    end
  end
end
