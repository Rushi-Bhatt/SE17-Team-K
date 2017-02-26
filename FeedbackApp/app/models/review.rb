class Review < ApplicationRecord
  belongs_to :course
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :course_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :likes, presence: true
  validates :dislikes, presence: true
end
