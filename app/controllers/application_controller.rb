class ApplicationController < ActionController::Base
  set_current_tenant_by_subdomain(:organization, :subdomain)
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pagy::Backend

  protected

  def authenticate_owner!
    unless current_user.organization_owner?
      flash[:alert] = "You are not authorized to perform this action"
      redirect_back_or_to(root_path)
    end
  end

  def authenticate_owner_or_team_leader!
    unless current_user.organization_owner? || current_user.has_role?(:team_leader)
      flash[:alert] = "You are not authorized to perform this action"
      redirect_back_or_to(root_path)
    end
  end

  def after_sign_in_path_for(resource)
    if resource.organization_owner?
      dashboard_index_url(subdomain: resource.owned_organization.subdomain)
    else
      dashboard_index_url(subdomain: resource.organization.subdomain)
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, owned_organization_attributes: [:name, :subdomain]])
  end
end
