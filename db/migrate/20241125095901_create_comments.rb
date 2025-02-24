class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments, id: :string do |t|
      t.references :user, null: false, foreign_key: true
      t.references :spot, null: false, foreign_key: true, type: :string
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
