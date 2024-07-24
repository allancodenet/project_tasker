class AddOrganizationToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :organization, null: false, foreign_key: true
  end
end
