class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.belongs_to :user, index: true
      t.belongs_to :recipe, index: true
      t.datetime :completion_date
      t.text :notes

      t.timestamps null: false
    end
  end
end
