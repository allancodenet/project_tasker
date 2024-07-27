class UrgentTaskJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ActsAsTenant.without_tenant do
      urgent_tasks = Task.urgent
      urgent_tasks.each do |task|
        UrgentTaskNotifier.with(record: task).deliver(task.assignee)
      end
    end
  end
end
