class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :pictures, as: :pictureable, dependent: :destroy

  validates :title, presence: true
end
