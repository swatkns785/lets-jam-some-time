class AddAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :user_id, null: false
      t.integer :jamsession_id, null: false
      t.boolean :approval, null: false, default: false
      t.string :instruments
      t.timestamps
    end
  end
end
