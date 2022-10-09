class Music < ApplicationRecord
  # has_rich_text :lyric
  belongs_to :user
  validates :name, presence: true
  validates :auth, presence: true

  has_many :lyrics
  has_many :music_user, through: :lyrics, source: :user

end
