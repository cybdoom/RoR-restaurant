class CreateReservations < ActiveRecord::Migration
  def up
    create_table :reservations do |t|
      t.integer :table
      t.datetime :start
      t.datetime :end
    end
  end

  def down
    drop_table :reservations
  end
end
