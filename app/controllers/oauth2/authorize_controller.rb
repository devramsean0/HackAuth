class Oauth2::AuthorizeController < ApplicationController
  def new
    oauth2_session = Oauth2::Session.create_with_code(client_id: params[:client_id], redirect_uri: params[:redirect_uri], state: params[:state], response_type: params[:response_type], scope: params[:scope], show_prompt: params[:show_prompt])
    @application = Application.find_by(id: Integer(params[:client_id]))
    @scope = params[:scope].split(",")
    session[:oauth_session_id] = oauth2_session.id
  end
end
