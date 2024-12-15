class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :legal_first_name
      t.string :legal_last_name
      t.string :preferred_first_name
      t.string :preferred_last_name
      t.string :email
      t.string :slack_id, :null => true

      t.timestamps
    end
  end
end
