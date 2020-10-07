class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipping_place
  belongs_to_active_hash :shipping_date

  VALID_PRICE_REGEX = /[0-9][\d]\w/.freeze

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :delivery_charge_id
      validates :shipping_place_id
      validates :shipping_date_id
    end

    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: VALID_PRICE_REGEX }
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image
end
