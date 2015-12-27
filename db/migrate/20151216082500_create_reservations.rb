class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :start_time
      t.date :end_time
      t.integer :length
      t.integer :listing_id
      t.integer :user_id
     
    
    end
  end
end
