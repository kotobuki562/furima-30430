require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('/camera.png')
    end

    it 'imageとname、text,category_id,state_id,delivery_charge_id,shipping_place_id,shipping_date_id,priceが存在すれば出品できること' do
      expect(@item).to be_valid
    end

    # ーーーーーーーーーーーー下記バリデーションの検証ーーーーーーーーーーーーー

    it 'imageがない場合出品できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameがない場合出品できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'nameが40文字以上場合出品できないこと' do
      @item.name = 'あ' * 50
      @item.valid?
      expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
    end

    it 'textがない場合出品できないこと' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'text1000文字以上だと出品できないこと' do
      @item.text = 'あ' * 1500
      @item.valid?
      expect(@item.errors.full_messages).to include('Text is too long (maximum is 1000 characters)')
    end

    it 'category_idがない場合出品できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
    end

    it 'category_idが1の場合出品できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'state_idがない場合出品できないこと' do
      @item.state_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank", 'State is not a number')
    end

    it 'state_idが1の場合出品できないこと' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('State must be other than 1')
    end

    it 'delivery_charge_idがない場合出品できないこと' do
      @item.delivery_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank", 'Delivery charge is not a number')
    end

    it 'delivery_charge_idが1だと出品できないこと' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery charge must be other than 1')
    end

    it 'shipping_place_idがない場合出品できないこと' do
      @item.shipping_place_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping place can't be blank", 'Shipping place is not a number')
    end

    it 'shipping_place_idが1の場合出品できないこと' do
      @item.shipping_place_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping place must be other than 1')
    end

    it 'shipping_date_idがない場合出品できないこと' do
      @item.shipping_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank", 'Shipping date is not a number')
    end

    it 'shipping_date_idが1の場合出品できないこと' do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping date must be other than 1')
    end

    it 'priceがない場合出品できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number', 'Price is invalid')
    end

    it 'priceが300より少ない場合出品できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが9,999,999より多い場合出品できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it 'priceが全角文字の場合出品できないこと' do
      @item.price = '３０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number', 'Price is invalid')
    end
  end
end
