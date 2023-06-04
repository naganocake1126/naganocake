class Item < ApplicationRecord
  has_one_attached :image
  
  has_many :cart_items, dependent: :destroy
  
  def with_tax_price
    (price * 1.1).floor
  end

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :image, presence: true
  # validates :amount, presence: true
  
  
end
