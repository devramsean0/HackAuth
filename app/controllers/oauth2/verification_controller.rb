class Oauth2::VerificationController < ApplicationController
  def edit
    if current_user.verification_enabled
      if !current_user.otp_secret || params[:force_qr]
        current_user.otp_secret = User.generate_otp_secret
        current_user.save!
        issuer = 'HackAuth'
        label = "#{issuer}:#{current_user.email}"
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
end
