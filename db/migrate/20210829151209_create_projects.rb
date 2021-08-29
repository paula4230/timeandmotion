class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :RxC
      t.string :project_type
      t.string :state
      t.date :workflow_date
      t.integer :ticket_level
      t.integer :process_step_id
      t.float :hours_spent
      t.float :days_spent
      t.string :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
