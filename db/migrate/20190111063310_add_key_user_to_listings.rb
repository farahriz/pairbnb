class AddKeyUserToListings < ActiveRecord::Migration[5.2]
  def change
  	add_foreign_key :listings, :users
  end
end
