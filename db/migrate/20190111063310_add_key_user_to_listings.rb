class AddKeyUserToListings < ActiveRecord::Migration[5.2]
  def change
  	add_column :listings, :user_id, :integer
  	add_foreign_key :listings, :users
  end
end
