class CreateSpots < ActiveRecord::Migration[7.2]
  def change
    create_table :spots do |t|
      t.references :user, foreign_key: true
	    t.string :spot_name, null: false
	    t.integer :category, null: false
	    t.string :address, null: false
	    t.text :body, null: false
      t.timestamps
    end
  end
end
