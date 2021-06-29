class AddIndexToTeam < ActiveRecord::Migration[6.1]
  def up
    add_index :teams, [:name], unique: true
  end

  def down
    remove_index :teams, [:name], unique: true
  end
end
