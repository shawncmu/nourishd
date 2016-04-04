class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :challenge, index: true
      t.string :winner

      t.timestamps null: false
    end
  end
end
