class AddressPurchase
  include ActiveModel::Model
  attr_accessor :token, :post_coade, :prefectures_id, :municipality, :address, :tellphone_number, :building

  with_options presence: true do
    validates :token
    validates :post_coade
    validates :prefectures_id
    validates :municipality
    validates :address
    validates :tellphone_number
  end

  def save
    Address.create(post_coade: post_coade, prefectures_id: prefectures_id, municipality: municipality, tellphone_number: tellphone_number, building: building, purchase_id: purchase.id)
    Purchase.create(user_id: user.id, item_id: item.id)
  end
end
