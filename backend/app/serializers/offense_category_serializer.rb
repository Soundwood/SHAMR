class OffenseCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at
  has_many :twitter_profiles, through: :profile_offenses
end
