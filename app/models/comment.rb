class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable, dependent: :destroy

  def comment!(user)
    likes << Like.new(likeable: self, user: user)
  end

end
