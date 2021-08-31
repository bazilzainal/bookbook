class AddBooksUsers < ActiveRecord::Migration[6.1]
  def self.up
    create_table :books_users, :id => false do |t|
      t.integer :user_id
      t.integer :book_id
    end
  end

  def self.down
    drop_table :books_users
  end
end
