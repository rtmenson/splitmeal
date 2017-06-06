class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :menu_item_id
      t.integer :party_id
      t.boolean :is_shared

      t.timestamps

    end
  end
end
