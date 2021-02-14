class PurchaseHistriesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :show_item,          only: [:index, :create]
  before_action :sold_out,           only: :index
  def index
    @purchase_street = PurchaseStreet.new
  end

  def create
    @purchase_street = PurchaseStreet.new(purchase_params)
    if @purchase_street.valid?
      pay_item
      @purchase_street.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_street).permit(:prefecture_id, :postal_code, :municipality, :address, :building_name, :phone_number ).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def show_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency:'jpy'
    )
  end

  def sold_out
    if @item.purchase_history.present?
      redirect_to root_path
    end
  end

end
