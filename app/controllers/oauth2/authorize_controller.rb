class Oauth2::AuthorizeController < ApplicationController
  def new
    Oauth2::Session.new(client_id: params[:client_id], redirect_uri: params[:redirect_uri], state: params[:state], response_type: params[:response_type], scope: params[:scope], show_prompt: params[:show_prompt])
  end
end
