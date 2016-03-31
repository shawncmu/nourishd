class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :video_url
      t.integer :cook_time
      t.integer :serving
      t.string :course
      t.boolean :vegan
      t.boolean :gluten_free
      t.boolean :low_carb
      t.boolean :dairy_free
      t.boolean :nut_free
      t.boolean :soy_free
      t.string :equipment

      t.timestamps null: false
    end
  end
end
