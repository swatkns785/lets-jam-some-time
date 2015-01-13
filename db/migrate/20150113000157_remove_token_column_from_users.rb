class RemoveTokenColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :token, :string, null: false
  end
end
