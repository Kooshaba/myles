class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.datetime :shipped_at

      t.timestamps null: false
    end
  end
end
