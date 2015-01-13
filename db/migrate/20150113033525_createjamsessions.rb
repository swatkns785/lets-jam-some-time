class Createjamsessions < ActiveRecord::Migration
  def change
    create_table :jamsessions do |t|
      t.string :title, null: false
      t.string :location, null: false
      t.text :description, null: false
      t.string :present_instrument
      t.datetime :date, null: false
      t.string :desired_instruments
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
