class Lyric < ApplicationRecord
  belongs_to :user
  belongs_to :music, dependent: :destroy
end
