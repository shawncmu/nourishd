class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.belongs_to :user, index: true
      t.belongs_to :recipe, index: true
      t.integer :creator_id
      t.integer :partner_id
      t.string :partner_status
      t.string :post_status
      t.text :notes

      t.timestamps null: false
    end
  end
end
