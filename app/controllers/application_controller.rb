class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :basic_authentication_required!

  private

  def basic_authentication_required!
    if %w(staging production).include? Rails.env
      authenticate_or_request_with_http_basic do |user, pass|
        user == Settings.basic_auth.name && pass == Settings.basic_auth.pass
      end
    end
  end
end
