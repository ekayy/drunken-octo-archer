class Profile < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 400 }
end
