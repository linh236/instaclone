class Music < ApplicationRecord
  has_rich_text :lyric
  belongs_to :user
end
