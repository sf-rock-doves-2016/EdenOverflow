class Vote < ActiveRecord::Base
  validates :user_id, :type, presence: true

  belongs_to :user
  belongs_to :votable, polymorphic: true
end
