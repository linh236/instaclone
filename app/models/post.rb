class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  def post!(user)
    likes << Like.new(likeable: self, user: user)
  end

end
