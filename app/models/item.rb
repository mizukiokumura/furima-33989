class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase_history
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee_burden
  belongs_to :shipment_source_prefecture
  belongs_to :days_to_ship
  with_options presence: true do
    validates :name
    validates :item_description
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :delivery_fee_burden_id
      validates :shipment_source_prefecture_id
      validates :days_to_ship_id
    end
  end
end
