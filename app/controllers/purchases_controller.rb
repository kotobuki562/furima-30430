class PurchasesController < ApplicationController
  def index
  end

  def create
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
end
