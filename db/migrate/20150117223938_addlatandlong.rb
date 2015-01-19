class Addlatandlong < ActiveRecord::Migration
  def change
    add_column :jamsessions, :latitude, :float
    add_column :jamsessions, :longitude, :float
  end
end
