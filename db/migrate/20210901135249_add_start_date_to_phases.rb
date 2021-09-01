class AddStartDateToPhases < ActiveRecord::Migration[6.1]
  def change
    add_column :phases, :start_date, :date
  end
end
