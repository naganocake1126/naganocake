class Order < ApplicationRecord
  belongs_to :customer
  has_many :orders
  has_many :items
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :payment_method, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true
end
