class Broker < ActiveRecord::Migration[6.0]
  def change
    create_table :brokers do |t|
      t.string :name
      t.string :email_address
      t.timestamps
    end
  end
end
