class ChangeAvailabilityToBeBoolInBooks < ActiveRecord::Migration[6.1]
  def up
    change_column :books, :availability, :boolean
  end

  def down
    change_column :books, :availability, :string
  end
end