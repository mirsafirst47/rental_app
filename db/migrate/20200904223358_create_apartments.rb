class CreateApartments < ActiveRecord::Migration[6.0]
  def change
    create_table :apartments do |t|
      t.string :address
      t.integer :bathroom_num
      t.integer :bedroom_num
      t.float :rent_amount
      t.integer :broker_id

      t.timestamps
    end
  end
end
