class ChangeProtectedInTwitterProfiles < ActiveRecord::Migration[6.0]
  def change
    rename_column :twitter_profiles, :protected, :irreproachable
  end
end
