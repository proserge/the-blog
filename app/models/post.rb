class Post < ApplicationRecord
  validates :title, :body, presence: true
  validates :blog_id, presence: true
  belongs_to :blog
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  #belongs_to :user
end
