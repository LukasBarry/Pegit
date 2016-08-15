class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.integer :user_id
      t.integer :meetup_id

      t.timestamps null: false
    end
  end
end
