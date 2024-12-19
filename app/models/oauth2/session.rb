class Oauth2::Session < ApplicationRecord
  def self.create_with_code(*args)
    code = SecureRandom.base58(24)
    args[0][:code] = code
    oauth_session = Oauth2::Session.create(args[0])
    return oauth_session
  end
end
