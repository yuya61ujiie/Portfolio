class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :spot, foreign_key: true
      t.integer :scene, null: false
      t.integer :rating, null: false
      t.time :start_at, null: false
      t.time :finish_at, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
