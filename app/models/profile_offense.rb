class ProfileOffense < ApplicationRecord
  belongs_to :twitter_profile
  belongs_to :offense_category
end
