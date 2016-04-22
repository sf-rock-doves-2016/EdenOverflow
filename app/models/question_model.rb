class Question < ActiveRecord::Base
  validates :title, :body, :user_id, presence: true

  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  def rating
    Vote.where(votable_id: self.id, votable_type: "Question").sum(:count)
  end

  def comment_count
    self.comments.count
  end

end
