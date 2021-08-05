class CreateBookAvailabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :book_availabilities do |t|
      t.string :location
      t.string :location_code
      t.belongs_to :book

      t.timestamps
    end
  end
end
