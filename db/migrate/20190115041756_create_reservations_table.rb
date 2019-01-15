class CreateReservationsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.timestamps null: false
      t.datetime :check_in
      t.datetime :check_out
    end

  	add_column :reservations, :user_id, :integer
  	add_foreign_key :reservations, :users

  	add_column :reservations, :listing_id, :integer
  	add_foreign_key :reservations, :listings

  end
end
