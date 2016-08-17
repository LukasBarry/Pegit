class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :meetup, index: true, foreign_key: true
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
