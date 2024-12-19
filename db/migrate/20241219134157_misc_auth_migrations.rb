class MiscAuthMigrations < ActiveRecord::Migration[8.0]
  def change
    add_column :oauth2_sessions, :otp_validated, :boolean, default: false
    add_column :applications, :redirect_uri, :string
  end
end
