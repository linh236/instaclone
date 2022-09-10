class ApplicationController < ActionController::Base
  before_action :configure_permitted_params, if: :devise_controller?

  protected

    def render_flash type, message
      render turbo_stream: turbo_stream.update("flash", partial: "shared/flash", locals: { msg_type: type, message: message })
    end

    def full_messages messages
      messages.join("\n")
    end

    def user_login_required 
      if user_signed_in?
        true
      else
        render_flash(:alert, "You must be logged in to continue!")
      end
    end

    def upload_picture uploaded_file
      File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
        file.write(uploaded_file.read)
      end
      "/uploads/#{uploaded_file.original_filename}"
    end

    def configure_permitted_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
