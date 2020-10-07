class TwitterProfile < ApplicationRecord
    has_many :profile_offenses
    has_many :offense_categories, through: :profile_offenses
end
