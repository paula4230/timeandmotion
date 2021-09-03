class AddStartTimeAgainToPhases < ActiveRecord::Migration[6.1]
  def change
    add_column :phases, :start_time, :datetime
    add_column :phases, :end_time, :datetime
  end
end
