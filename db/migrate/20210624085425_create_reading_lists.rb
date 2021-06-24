class CreateReadingLists < ActiveRecord::Migration[6.1]
  def change
    create_table :reading_lists do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :reading_lists, :user_id
  end
end
