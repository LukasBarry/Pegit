class CreateHandicaps < ActiveRecord::Migration
  def change
    create_table :handicaps do |t|
      t.integer :score
      t.integer :course_rating
      t.integer :course_slope_rating
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
