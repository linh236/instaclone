module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def is_image type
    type.include?("image") 
  end

  def format_datetime datetime
    datetime.strftime("%Y-%m-%d")
  end
end
