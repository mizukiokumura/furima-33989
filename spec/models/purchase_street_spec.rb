require 'rails_helper'

RSpec.describe PurchaseStreet, type: :model do
  before do
    @street = FactoryBot.build(:purchase_street)
  end


  context '住所が保存できる時' do
    it '全ての情報が入力されていると保存できること' do
      expect(@street).to be_valid
    end
    it 'building_nameが無くても登録できること' do
      @street.building_name = ''
      expect(@street).to be_valid
    end
  end
  context '住所が保存できない時' do
    it 'prefecture_idが1だと保存できないこと' do
      @street.prefecture_id = 1
      @street.valid?
      expect(@street.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'postal_codeが入力されていないと保存できないこと' do
      @street.postal_code = nil
      @street.valid?
      expect(@street.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeに-が無いと保存できないこと' do
      @street.postal_code = 1234567
      @street.valid?
      expect(@street.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'postal_codeが正しい形じゃないと保存できない事' do
      @street.postal_code = 123-345
      @street.valid?
      expect(@street.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'municipalityが無いと保存できないこと' do
      @street.municipality = ''
      @street.valid?
      expect(@street.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'municipalityが全角じゃないと保存できないこと' do
      @street.municipality = "hogehuga"
      @street.valid?
      expect(@street.errors.full_messages).to include("Municipality is invalid. Input full-width characters.")
    end
    it 'addressが無いと保存できないこと'do
      @street.address = ''
      @street.valid?
      expect(@street.errors.full_messages).to include("Address can't be blank")
    end
    it 'addressが全角じゃないと保存できないこと' do
      @street.address = 'hogehuga'
      @street.valid?
      expect(@street.errors.full_messages).to include("Address is invalid. Input full-width characters.")
    end
    it 'building_nameはなくても保存できること' do
      @street.building_name = ''
      expect(@street).to be_valid
    end
    it 'phone_numberが無いと保存できないこと' do
      @street.phone_number = ''
      @street.valid?
      expect(@street.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが半角数字じゃ無いと保存できないこと' do
      @street.phone_number = '０８０１２３４５６７８'
      @street.valid?
      expect(@street.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
    end
    it 'phone_numberが11桁無いと保存できない事' do
      @street.phone_number = "0801234567"
      @street.valid?
      expect(@street.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
    end
    it 'phone_numberが11桁以上だと保存できない事' do
      @street.phone_number = "080123456789"
      @street.valid?
      expect(@street.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
    end
    it 'tokenが空だと保存できない事' do
      @street.token = ''
      @street.valid?
      expect(@street.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空だと保存できない事' do
      @street.user_id = nil
      @street.valid?
      expect(@street.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できないこと' do
      @street.item_id = nil
      @street.valid?
      expect(@street.errors.full_messages).to include("Item can't be blank")
    end
  end
end
