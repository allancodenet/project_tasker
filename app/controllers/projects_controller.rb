class ProjectsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  def index
    @projects =[]
    10.times.each do |index|
      @projects << "project_#{index + 1}"
    end

  end
end
