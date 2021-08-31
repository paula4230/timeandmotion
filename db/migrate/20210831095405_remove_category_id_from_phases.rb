class RemoveCategoryIdFromPhases < ActiveRecord::Migration[6.1]
  def change
    remove_column :phases, :category_id, :integer
  end
end
