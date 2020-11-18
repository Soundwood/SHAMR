class CreateTwitterProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :twitter_profiles do |t|
      t.string :username
      t.integer :user_id
      t.string :display_name
      t.boolean :offender
      t.boolean :protected

      t.timestamps
    end
  end
end
