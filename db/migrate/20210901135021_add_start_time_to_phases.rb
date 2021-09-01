class AddStartTimeToPhases < ActiveRecord::Migration[6.1]
  def change
    add_column :phases, :start_time, :time
  end
end
