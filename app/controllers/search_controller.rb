class SearchController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  def index
    @name = params[:name]
    if @name.present?
      @projects = Project.where("name ILIKE?", "%#{@name}%")
    end
  end
end
