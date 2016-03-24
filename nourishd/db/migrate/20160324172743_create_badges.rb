class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.belongs_to :user
      t.string :badge_name
      t.integer :badge_type

      t.timestamps null: false
    end
  end
end
