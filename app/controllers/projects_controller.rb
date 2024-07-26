class ProjectsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :authenticate_owner!, only: %i[new create edit update destroy]
  before_action :set_project, only: [:edit, :update, :destroy, :show]
  def index
    if current_user.organization_owner?
      @pagy, @projects = pagy(Project.includes(:tasks), items: 5)
    else
      @pagy, @projects = pagy(current_user.projects.includes(:tasks), items: 5)
    end
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_url, notice: "Project Created"
    else
      redirect_to projects_url, alert: @project.errors.full_messages.join(",")
    end
  end

  def show
    @q = @project.tasks.ransack(params[:q])
    if current_user.organization_owner? || current_user.has_role?(:team_leader)
      @pagy, @tasks = pagy(@q.result.incomplete_first, items: 5)
    else
      @pagy, @tasks = pagy(@q.result.incomplete_first.where(assignee: current_user), items: 5)
    end
  end

  def edit
  end

  def update
    @project.update(project_params)
    if @project.save
      redirect_to projects_url, notice: "Project Updated"
    else
      redirect_to projects_url, alert: @project.errors.full_messages.join(",")
    end
  end

  def destroy
    @project.destroy!
    redirect_to projects_url, notice: "Project deleted"
  end

  private

  def set_project
    @project = if current_user.organization_owner?
      Project.find(params[:id])
    else
      current_user.projects.find(params[:id])
    end
  end

  def project_params
    params.require(:project).permit(:name, :team_id)
  end
end
