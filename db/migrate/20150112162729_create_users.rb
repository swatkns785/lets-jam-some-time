class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :permalink, null: false
      t.string :avatar_url, null: false
      t.integer :soundcloud_id, null: false
    end
  end
end
