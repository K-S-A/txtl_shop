require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :json

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def main
    render 'layouts/application'
  end

  protected

  def configure_permitted_parameters
    [:sign_up, :account_update].each do |a|
      devise_parameter_sanitizer.for(a) << :first_name << :last_name
    end
  end

end
