class RemoveTwitterProfileFromOffenseCategories < ActiveRecord::Migration[6.0]
  def change
    remove_reference :offense_categories, :twitter_profile, null: false, foreign_key: true
  end
end
