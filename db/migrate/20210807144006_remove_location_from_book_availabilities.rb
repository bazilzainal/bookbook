class RemoveLocationFromBookAvailabilities < ActiveRecord::Migration[6.1]
  def change
    remove_column :book_availabilities, :location, :string
  end
end
