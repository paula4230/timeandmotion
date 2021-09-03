class RemoveStartTimeAgainFromPhases < ActiveRecord::Migration[6.1]
  def change
    remove_column :phases, :start_time
    remove_column :phases, :end_time
  end
end
