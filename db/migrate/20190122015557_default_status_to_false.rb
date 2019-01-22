class DefaultStatusToFalse < ActiveRecord::Migration[5.2]
  def change
  	change_column :reservations, :status, :boolean, :default => false
  end
end
