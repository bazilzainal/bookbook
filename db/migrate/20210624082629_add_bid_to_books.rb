class AddBidToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :bid, :integer
    add_index :books, :bid
  end
end
