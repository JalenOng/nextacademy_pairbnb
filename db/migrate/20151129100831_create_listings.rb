class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.integer :bedroom
      t.integer :accomodates
      t.string :location
      t.float :price_per_night
      t.references :user, index: true

      t.timestamps null: false
    end

    add_foreign_key :listings, :users
    add_index :listings, [:user_id, :created_at]
  end
end
