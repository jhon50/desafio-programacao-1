class OrderService
  def initialize(order)
    @order = order
  end

  def call
    total_value = create_order

  end

  private

  def create_order
    total_value = 0
    @order.each do |row|
      Order.create!({
        :customer_id => Customer.get_customer_id(row),
        :item_description => row['item description'],
        :item_price => row['item price'],
        :purchase_count => row['purchase count'],
        :merchant_id => Merchant.get_merchant_id(row)
      })
      total_value += row['item price'].to_f * row['purchase count'].to_f
    end
    total_value
  end
end