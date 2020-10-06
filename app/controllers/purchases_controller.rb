class PurchasesController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @item = Item.find(params[:id])
    @address_purchase = AddressPurchase.new
  end


  def create
    # binding.pry
    @item = Item.find(params[:id])
    @address_purchase = AddressPurchase.new(purchase_params)
    if @address_purchase.valid?
      pay_item
      @address_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:address_purchase).permit(:post_coade,:prefectures_id,:municipality,:address,:tellphone_number,:building).merge(token: params[:token])
  end
  

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      # amount: order_params[:price],
      card: purchase_params[:token],
      currency:'jpy'
    )
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
