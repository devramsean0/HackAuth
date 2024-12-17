class UserController < ApplicationController
  def additional_information
    current_user.update(params)
  end
end
