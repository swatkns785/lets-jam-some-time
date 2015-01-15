class AddTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :track_title, null: false
      t.string :track_location, null: false
      t.integer :user_id
      t.integer :jamsession_id
      t.timestamps
    end
  end
end
