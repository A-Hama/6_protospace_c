class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :prototype , null: false, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
