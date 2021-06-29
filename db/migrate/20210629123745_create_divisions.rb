class CreateDivisions < ActiveRecord::Migration[6.1]
  def change
    create_table :divisions do |t|
      t.string :name, null: false
      t.string :description, limit: 240
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
    add_index :divisions, [:name], unique: true
  end
end
