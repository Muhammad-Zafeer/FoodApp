class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  validates :card_user_name, presence: true, length: { maximum: 255 }
  validates :card_expire_date, presence: true
  validates :cart_number, presence: true, length: { is: 16 }, numericality: { only_integer: true }

  
end
