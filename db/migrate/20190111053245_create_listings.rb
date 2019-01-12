class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :policy
      t.integer :num_bedroom	
      t.integer :num_bed	
      t.integer :num_bathroom	
      t.integer :max_guests	
      t.timestamps
    end
  end
end
