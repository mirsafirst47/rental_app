class CreateRentalApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :rental_applications do |t|
      t.datetime :date
      t.integer :application_number
      t.integer :tenant_id
      t.integer :apartment_id
      
      t.timestamps
    end
  end
end
