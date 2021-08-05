class RemoveAvailabilityAndLocationFromBook < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :availability, :string
    remove_column :books, :location, :string
  end
end
