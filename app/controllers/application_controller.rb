class ApplicationController < ActionController::API
  include Pundit::Authorization

  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_devise_api_token!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    current_devise_api_user
  end

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    render json: { message: "#{policy_name}.#{exception.query}" }, status: :forbidden
  end
end
