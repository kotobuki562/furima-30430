require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @address_purchase = FactoryBot.create(:address_purchase,user_id: @user.id,item_id: @item.id)
  end

  it "必須項目があれば保存ができること" do
    expect(@address_purchase).to be_valid
  end
end
