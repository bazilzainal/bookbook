class RemoveStatusDescriptionFromBookAvailabilities < ActiveRecord::Migration[6.1]
  def change
    remove_column :book_availabilities, :status_description, :string
  end
end
