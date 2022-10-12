module PowerpointHelper
  def preview_path file 
    "#{Rails.root}/public/powerpoints/#{file}"
  end
end
