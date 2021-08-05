class AddRollToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :roll, :integer, null: false, default: 0
    add_index :users, :roll
  end

  def down
    remove_column :users, :roll, :integer
    remove_index :users, :roll
  end
end
