class AddStatusCodeAndStatusDescriptionToBookAvailability < ActiveRecord::Migration[6.1]
  def change
    add_column :book_availabilities, :status_code, :string
    add_column :book_availabilities, :status_description, :string
  end
end
