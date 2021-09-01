class AddEndTimeToPhases < ActiveRecord::Migration[6.1]
  def change
    add_column :phases, :end_time, :time
  end
end
