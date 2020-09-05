class AddBrokerIdToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :broker_id, :integer
  end
end
