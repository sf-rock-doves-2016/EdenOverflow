class Comment < ActiveRecord::Base
  validates :body, :user_id, presence: true

  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
