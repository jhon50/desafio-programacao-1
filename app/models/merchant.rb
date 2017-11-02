class Merchant < ApplicationRecord
  has_many :orders

  def self.get_merchant_id(params)
    id = Merchant.where("name LIKE ?", "%#{params['merchant name']}%").first&.id
    id.nil? ? create_merchant(params)&.id : id
  end

  private

  def self.create_merchant(params)
    Merchant.create!({
                         :name => params['merchant name'],
                         :address => params['merchant address']

                     })
  end

end
