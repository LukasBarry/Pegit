class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.datetime :datetime
      t.text :description
      t.references :user_id

      t.timestamps null: false
    end
  end
end
