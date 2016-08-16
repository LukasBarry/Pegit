class AddDiffsToHandicaps < ActiveRecord::Migration
  def change
    add_column :handicaps, :differential, :decimal
  end
end
