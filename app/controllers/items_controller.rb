class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_show, only: [:edit, :update, :destroy]
  before_action :sold_out,     only: [:edit, :update]
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

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end

  end

  private

  def item_params
    params.require(:item).permit(:name, :item_description, :price, :category_id, :state_id, :delivery_fee_burden_id,
                                 :shipment_source_prefecture_id, :days_to_ship_id, :image).merge(user_id: current_user.id)
  end

  def move_to_show
    unless current_user.id == @item.user.id
        redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_out
    if @item.purchase_history.present?
      redirect_to root_path
    end
  end
end
