class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :jp_first_name, :jp_last_name, :jp_kana_first_name, :jp_kana_last_name,
                                             :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USERS"] && password == ENV["BASIC_AUTH_PASSWORDS"]
    end
  end
end
