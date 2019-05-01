class ApiController < ApplicationController
  before_action :set_default_format, :authenticate_user
  include ActionController::RequestForgeryProtection
  attr_reader :current_user

  private
  def set_default_format
    request.format = :json
  end

  def authenticate_user
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
  end

end
