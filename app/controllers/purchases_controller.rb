class PurchasesController < ApplicationController
  before_action :set_item, only: [:index,:create,:move_to_index_user]
  before_action :move_to_index, only: [:index,:create]
  before_action :move_to_index_user, only: [:index,:create]

  def index
    @address_purchase = AddressPurchase.new
    if @item.purchase
      if current_user
        redirect_to root_path
      end
    end
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
    params.require(:address_purchase).permit(:post_coade, :prefectures_id, :municipality, :address, :tellphone_number, :building).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    unless user_signed_in?
    redirect_to new_user_session_path
    end
  end

  def move_to_index_user
    if current_user.id == @item.user_id
      redirect_to root_path 
    end
  end
end
