class OffenseCategory < ApplicationRecord
    has_many :profile_offenses
    has_many :twitter_profiles, through: :profile_offenses, dependent: :destroy
end
