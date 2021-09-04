class AddPhaseComparisonIdToPhases < ActiveRecord::Migration[6.1]
  def change
    add_column :phases, :phase_comparison_id, :integer
  end
end
