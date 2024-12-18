class Oauth2::Session < ApplicationRecord
  def new(*args)
    code = SecureRandom.base58(24)
    Oauth2::Session.create(args.merge(code: code))
  end
end
