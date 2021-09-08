class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.string :title
      t.integer :category_id

      t.timestamps
    end
  end
end
