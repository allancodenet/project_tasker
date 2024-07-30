class OrganizationUsersController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :require_subscription!
  def index
    @users = current_tenant.users
  end

  def change_role
    @user = current_tenant.users.find(params[:id])
    if @user.roles.any?
      roles = @user.roles.pluck(:name)
      roles.each do |role|
        @user.remove_role(role)
      end
    end

    @user.add_role(params[:role])
    redirect_to organization_users_path, notice: "role updated"
  end
end
