class PurchasesController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
  end

  def create
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
    params.require(:address_purchase).permit(:token,:post_coade,:prefectures_id,:municipality,:address,:tellphone_number,:building)
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
