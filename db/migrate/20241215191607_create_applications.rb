class CreateApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :client_id
      t.string :client_secret
      t.string :owner_slack_id
      t.boolean :approved

      t.timestamps
    end
  end
end
