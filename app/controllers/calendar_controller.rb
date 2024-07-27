class CalendarController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @tasks = if current_user.organization_owner?
      Task.where(due_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    elsif current_user.has_role?(:team_leader)
      Task.where(projects: current_user.projects, due_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    else
      Task.where(assignee: current_user, projects: current_user.projects, due_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

    end
  end
end
