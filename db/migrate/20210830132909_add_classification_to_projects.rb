class AddClassificationToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :classification, :string
  end
end
