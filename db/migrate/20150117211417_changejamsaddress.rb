class Changejamsaddress < ActiveRecord::Migration
  def change
    remove_column :jamsessions, :location, :string, null: false

    add_column :jamsessions, :address, :string, null: false
    add_column :jamsessions, :city, :string, null: false
    add_column :jamsessions, :state, :string, null: false
    add_column :jamsessions, :zip_code, :string, null: false
  end
end
