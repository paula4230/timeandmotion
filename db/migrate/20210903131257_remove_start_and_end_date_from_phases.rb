class RemoveStartAndEndDateFromPhases < ActiveRecord::Migration[6.1]
  def change
    remove_column :phases, :start_date
    remove_column :phases, :end_date
  end
end
