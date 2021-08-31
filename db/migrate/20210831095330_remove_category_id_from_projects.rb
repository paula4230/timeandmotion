class RemoveCategoryIdFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :category_id, :integer
  end
end
