class OrderService
  def initialize(order)
    @order = order
  end

  def call
    create_order
  end

  private

  def create_order
    @order.each do |row|
      Order.create!({
        :customer_id => Customer.get_customer_id(row),
        :item_description => row['item description'],
        :item_price => row['item price'],
        :purchase_count => row['purchase count'],
        :merchant_id => Merchant.get_merchant_id(row)
      })
    end
    ## CASO NAO EXISTA CUSTOMER OU MERCHANT ELE IRÁ CRIAR E RETORNAR O ID
    ## CASO JA EXISTA RETORNA APENAS O ID E SALVA O ORDER! SIMPLES ASSIM!
  end
end