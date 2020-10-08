class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    if  @item = Item.create(item_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # 以下は備忘録として残させてください
    # @item_category = Category.find(@item.category_id)
    # @item_state = State.find(@item.state_id)
    # @item_delivery_charge = DeliveryCharge.find(@item.delivery_charge_id)
    # @item_shipping_place = ShippingPlace.find(@item.shipping_place_id)
    # @item_shipping_date = ShippingDate.find(@item.shipping_date_id)
    # @item_category.nameでname出力
  end

  def edit
    if @item.purchase
      redirect_to action: :index if current_user
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :text, :name, :category_id, :state_id, :delivery_charge_id, :shipping_place_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
