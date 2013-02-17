class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :year
      t.string :email
      t.string :first
      t.string :last
      t.integer :order

      t.timestamps
    end
  end
end
