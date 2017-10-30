class OrderService
  def initialize(order)
    @order = order
  end

  def call
    create_order
    persist_order
  end

  private

  def persist_order
    Order.create! {

    }
  end

  def create_order
    @created_order = OrderCreator.new(@order)
  end
end