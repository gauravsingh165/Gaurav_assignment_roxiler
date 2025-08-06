# app/controllers/api/v1/users_controller.rb
class Api::V1::UsersController < ApplicationController
  before_action :set_current_user
  before_action :authorize_access!

  def index
    @users = @current_user.admin? ? User.includes(:job_applications) : [@current_user]
  end

  private

  def set_current_user
    @current_user = User.includes(:role).find_by(id: params[:user_id])
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
  end

  def authorize_access!
    unless @current_user.admin? || @current_user.candidate?
      render json: { error: 'Forbidden' }, status: :forbidden
    end
  end
end
