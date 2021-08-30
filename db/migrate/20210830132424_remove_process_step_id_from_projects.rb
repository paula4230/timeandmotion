class RemoveProcessStepIdFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :process_step_id, :integer
  end
end
