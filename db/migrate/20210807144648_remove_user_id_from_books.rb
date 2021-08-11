class RemoveUserIdFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :user_id, :integer
  end
end
