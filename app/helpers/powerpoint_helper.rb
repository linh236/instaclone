module PowerpointHelper
  def preview_path file 
    "#{Rails.application.config.site_url}/powerpoints/#{file}"
  end
end
