class ApplicationController < ActionController::Base
  set_current_tenant_by_subdomain(:organization, :subdomain)
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pagy::Backend

  protected

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
