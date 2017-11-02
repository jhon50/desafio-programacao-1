class Customer < ApplicationRecord
  has_many :orders

  def self.get_customer_id(params)
    id = Customer.where("name LIKE ?", "%#{params['purchaser name']}%").first&.id
    id.nil? ? create_customer(params)&.id : id
  end

  private

  def self.create_customer(params)
    Customer.create!({
                         :name => params['purchaser name']
                     })
  end
end
