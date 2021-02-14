class PurchaseStreet

  include ActiveModel::Model
  attr_accessor :prefecture_id, :postal_code, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality,  format: {with: /\A[ぁ-んァ-ン一-龥々]/, message: 'is invalid. Input full-width characters.'}
    validates :address,       format: {with: /\A[ぁ-んァ-ン一-龥々]/, message: 'is invalid, Input full-width characters'}
    validates :phone_number,  format: {with: /\A\d{11}\z/, message: "is invalid. Input half-width characters."}
    validates :prefecture_id,   numericality: { other_than: 1 }
    validates :token
  end
  

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(prefecture_id: prefecture_id, postal_code: postal_code, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end