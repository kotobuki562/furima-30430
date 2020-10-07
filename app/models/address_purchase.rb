class AddressPurchase
  include ActiveModel::Model
  attr_accessor :token,:post_coade, :prefectures_id, :municipality, :address, :tellphone_number, :building,:purchase_id, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :post_coade,format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures_id,numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :tellphone_number,format: {with: /\A[0-9]+\z/ },length: { maximum: 11 }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    purchase
    Address.create(post_coade: post_coade, prefectures_id: prefectures_id, municipality: municipality,address: address, tellphone_number: tellphone_number, building: building, purchase_id: purchase.id)
  end
end
