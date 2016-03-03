class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  authorize_resource

  def index
    @users = User.featured(20)
  end

  def show
    @collections = @user.collections
    @resources = @user.resources
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
