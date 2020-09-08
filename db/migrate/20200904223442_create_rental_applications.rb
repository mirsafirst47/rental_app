class CreateRentalApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :rental_applications do |t|
      t.integer :tenant_id
      t.integer :apartment_id
      t.string :description
      
      t.timestamps
    end
  end
end
