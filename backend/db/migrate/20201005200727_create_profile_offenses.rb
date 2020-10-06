class CreateProfileOffenses < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_offenses do |t|
      t.references :twitter_profile, null: false, foreign_key: true
      t.references :offense_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
