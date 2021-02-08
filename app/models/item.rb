class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee_burden
  belongs_to :shipment_source_prefecture 
  belongs_to :days_to_ship
  with_options presence: true do
    validates :name 
    validates :item_description
    validates :user
    validates :price,                         numericality: {only_integer:true, greater_than:300, less_than:9999999 }
    validates :category_id,                   numericality: {other_than: 1 }
    validates :state_id,                      numericality: {other_than: 1 }
    validates :delivery_fee_burden_id,        numericality: {other_than: 1 }
    validates :shipment_source_prefecture_id, numericality: {other_than: 1 }
    validates :days_to_ship_id,               numericality: {other_than: 1 }
    validates :image
  end
end
