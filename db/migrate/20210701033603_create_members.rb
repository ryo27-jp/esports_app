class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :url
      t.text :biography
      t.references :division, null: false, foreign_key: true

      t.timestamps
    end
  end
end
