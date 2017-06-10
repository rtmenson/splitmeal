class AddDinerIdToShares < ActiveRecord::Migration[5.0]
  def change
    add_column :shares, :diner_id, :integer
  end
end
