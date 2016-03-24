class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :instructions
      t.string :video_url
      t.integer :cook_time
      t.integer :serving
      t.string :course
      t.boolean :vegan
      t.boolean :gluten_free
      t.boolean :low_carb
      t.integer :exp_value
      t.string :equipment

      t.timestamps null: false
    end
  end
end
