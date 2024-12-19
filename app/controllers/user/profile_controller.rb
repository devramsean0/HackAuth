class User::ProfileController < ApplicationController
  def edit
    current_user.update!(params.expect(user: [:legal_first_name, :legal_last_name, :preferred_first_name, :preferred_last_name, :dob, :phone_number]))
  end
end
