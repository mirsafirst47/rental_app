class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :email_address
      t.integer :age
      t.string :password_digest

      t.timestamps
    end
  end
end
