class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :check_in_date
      t.date :check_out_date
      t.integer :listing_id
      t.integer :user_id
    end
  end
end
