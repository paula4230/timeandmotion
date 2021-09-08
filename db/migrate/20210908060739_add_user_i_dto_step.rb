class AddUserIDtoStep < ActiveRecord::Migration[6.1]
  def change
    add_column :steps, :user_id, :integer
  end
end
