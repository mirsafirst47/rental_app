class CreateApartments < ActiveRecord::Migration[6.0]
  def change
    create_table :apartments do |t|
      t.string :address
      t.integer :bathroom_num
      t.integer :bedroom_num
      t.float :rent_amount
      # t.belongs_to :neighborhood, null: false, foreign_key: true
      t.integer :broker_id

      t.timestamps
    end
  end
end
