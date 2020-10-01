class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category_id
    validates :state_id
    validates :delivery_charge_id
    validates :shipping_place_id
    validates :shipping_date_id
    validates :price

  end

  belongs_to :user
  has_one_attached :image
end
