class CreateOauth2Sessions < ActiveRecord::Migration[8.0]
  def change
    create_table :oauth2_sessions do |t|
      t.belongs_to :user
      t.numeric :client_id, null: false
      t.string :state, null: false
      t.string :redirect_uri, null: false
      t.string :response_type, null: false
      t.string :scope, null: false
      t.string :code, null: false
      t.boolean :show_prompt, null: true, default: true
      t.timestamps
    end
    remove_column :applications, :client_id
  end
end
