class SetupUserForVerification < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :verification_enabled, :boolean, default: true
    add_column :users, :otp_secret, :string
    add_column :users, :consumed_timestep, :integer
    add_column :users, :otp_required_for_login, :boolean, default: false
  end
end
