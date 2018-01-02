class Item < ApplicationRecord
  validates :name, :description, presence: true
  has_many  :order_items
  has_many  :orders, through: :order_items
end
