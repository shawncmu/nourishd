class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.belongs_to :recipe, index: true
      t.text :step
      t.integer :order

      t.timestamps null: false
    end
  end
end
