class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.belongs_to :recipe, index: true
      t.integer :creator_id
      t.integer :participant_id
      t.string :creator_status
      t.string :participant_status
      t.string :participant_acceptance
      t.string :post_type
      t.string :post_status
      t.text :notes

      t.timestamps null: false
    end
  end
end
