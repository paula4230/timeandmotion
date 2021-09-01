class RemoveEndTimeFromPhases < ActiveRecord::Migration[6.1]
  def change
    remove_column :phases, :end_time, :datetime
  end
end
