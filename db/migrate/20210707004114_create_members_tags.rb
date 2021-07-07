class CreateMembersTags < ActiveRecord::Migration[6.1]
  def change
    create_table :members_tags do |t|
      t.references :member, null: false, foreign_key: true
      t.references :tags, null: false, foreign_key: true

      t.timestamps
    end
  end
end
