class RemoveStartTimeFromPhases < ActiveRecord::Migration[6.1]
  def change
    remove_column :phases, :start_time, :datetime
  end
end
