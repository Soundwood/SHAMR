class TwitterProfileSerializer < ActiveModel::Serializer
  attributes :id, :username, :user_id, :display_name, :offender, :protected, :created_at
  has_many :offense_categories, through: :profile_offenses
end