class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  with_options presence: true do
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Input half-width characters.' }
    validates :jp_first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: 'is invalid. Input full-width characters.' }
    validates :jp_last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: 'is invalid. Input full-width characters.' }
    validates :jp_kana_first_name, format: { with: /\A[ァ-ヶー-]+\z/, message: 'is invalid. Input full-widrh katakana characters.' }
    validates :jp_kana_last_name, format: { with: /\A[ァ-ヶー-]+\z/, message: 'is invalid. Input full-widrh katakana characters.' }
    validates :birthday
    validates :nickname
  end
end
