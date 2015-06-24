class Idea < ActiveRecord::Base

  validates :title, presence: true
  validates :body, presence: true

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  has_many :joins, dependent: :destroy
  has_many :joining_users, through: :joins, source: :user

  def like_for(user)
    likes.find_by_user_id(user)
  end

end
