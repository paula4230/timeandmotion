class AddIntentToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :intent, :string
  end
end
