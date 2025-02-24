class CreateBookmarks < ActiveRecord::Migration[7.2]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :spot, null: false, foreign_key: true, type: :string

      t.timestamps
    end
    add_index :bookmarks, [ :user_id, :spot_id ], unique: true
  end
end
