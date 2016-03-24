class CreateQuantities < ActiveRecord::Migration
  def change
    create_table :quantities do |t|
      t.belongs_to :ingredient, index: true
      t.belongs_to :recipe, index: true
      t.string :measurement

      t.timestamps null: false
    end
  end
end
