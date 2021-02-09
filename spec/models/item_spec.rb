require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品できる時' do
      it '商品の全ての情報が入っていると出品できること' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない時' do
      it '商品の名前が入っていないと出品できない事' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと出品できない事' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it '商品のカテゴリが入ってないと出品できない事' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態が記入されていないと出品できない事' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end
      it '商品の配送料の負担が記入されていないと出品できないこと' do
        @item.delivery_fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee burden must be other than 1')
      end
      it '商品の発送元の地域が記入されていないと出品できない事' do
        @item.shipment_source_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment source prefecture must be other than 1')
      end
      it '商品の発送までの日数が記入されていないと出品できない事' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end
      it '商品の値段が記入されていないと出品できない事' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '商品の値段が３００円未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '商品の値段が９９９９９９９円を超えると出品できない' do
        @item.price = 99_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '商品の値段が全角だと出品できない' do
        @item.price = '３３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '商品が半角英数字混合では出品できない' do
        @item.price = '3e2t4'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '商品が半角英字のみでは出品できない' do
        @item.price = 'rrrrra'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '商品の画像が記入されていないと出品できない事' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
