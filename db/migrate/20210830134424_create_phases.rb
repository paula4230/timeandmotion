class CreatePhases < ActiveRecord::Migration[6.1]
  def change
    create_table :phases do |t|
      t.string :step
      t.datetime :start_time
      t.datetime :end_time
      t.float :durationinmin
      t.string :remarks
      t.integer :user_id
      t.integer :project_id
      t.integer :category_id

      t.timestamps
    end
  end
end
