require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  it "priceとtokenがあれば保存ができること" do
    
    expect(@purchase).to be_valid
  end
end