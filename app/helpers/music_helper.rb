module MusicHelper
  def find_edit_lyric lyrics, current_user
    lyrics.find_by(user_id: current_user.id)
  end
end
