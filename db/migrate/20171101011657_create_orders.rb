class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string  :item_description
      t.decimal :item_price, precision: 16, scale: 2
      t.decimal :purchase_count, precision: 16, scale: 2
    end

    add_reference :orders, :merchant, foreign_key: true
    add_reference :orders, :customer, foreign_key: true
  end
end
