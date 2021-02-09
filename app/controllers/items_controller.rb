class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_show, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_description, :price, :category_id, :state_id, :delivery_fee_burden_id,
                                 :shipment_source_prefecture_id, :days_to_ship_id, :image).merge(user_id: current_user.id)
  end

  def move_to_show
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
