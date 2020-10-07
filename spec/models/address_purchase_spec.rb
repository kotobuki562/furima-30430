require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @address_purchase = FactoryBot.build(:address_purchase, user_id: @user.id, item_id: @item.id)
  end

  it '必須項目があれば保存ができること' do
    expect(@address_purchase).to be_valid
  end

  it 'buildingがなくても購入できないこと' do
    @address_purchase.building = nil
    expect(@address_purchase).to be_valid
  end

  it 'tokenがない場合購入できないこと' do
    @address_purchase.token = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Token can't be blank")
  end

  it 'post_coadeがない場合購入できないこと' do
    @address_purchase.post_coade = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Post coade can't be blank", 'Post coade is invalid')
  end

  it 'post_coadeにハイフンをつけないと購入できないこと' do
    @address_purchase.post_coade = '1234567'
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include('Post coade is invalid')
  end

  it 'prefectures_idがない場合購入できないこと' do
    @address_purchase.prefectures_id = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Prefectures can't be blank", 'Prefectures is not a number')
  end

  it 'prefectures_idが1の場合購入できないこと' do
    @address_purchase.prefectures_id = 1
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include('Prefectures must be other than 1')
  end

  it 'municipalityがない場合購入できないこと' do
    @address_purchase.municipality = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Municipality can't be blank")
  end

  it 'addressがない場合購入できないこと' do
    @address_purchase.address = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Address can't be blank")
  end

  it 'tellphone_numberがない場合購入できないこと' do
    @address_purchase.tellphone_number = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Tellphone number can't be blank", 'Tellphone number is invalid')
  end

  it 'tellphone_numberに数字以外を入れると場合購入できないこと' do
    @address_purchase.tellphone_number = 'hello'
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include('Tellphone number is invalid')
  end

  it 'tellphone_numberに11文字以上を入れると場合購入できないこと' do
    @address_purchase.tellphone_number = '1234567891011'
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include('Tellphone number is too long (maximum is 11 characters)')
  end
end
