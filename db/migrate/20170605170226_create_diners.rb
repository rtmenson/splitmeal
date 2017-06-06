class CreateDiners < ActiveRecord::Migration[5.0]
  def change
    create_table :diners do |t|
      t.integer :party_id
      t.integer :user_id

      t.timestamps

    end
  end
end
