class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments
  has_one :picture, as: :pictureable
  validates :username, presence: true

end
