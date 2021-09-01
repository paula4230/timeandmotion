class AddEndDateToPhases < ActiveRecord::Migration[6.1]
  def change
    add_column :phases, :end_date, :date
  end
end
