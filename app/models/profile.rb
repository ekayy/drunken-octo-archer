class Profile < ActiveRecord::Base
  attr_accessible :content, :name, :tagline, :user_id
  has_one :user

  validates :user_id, presence: true
end
