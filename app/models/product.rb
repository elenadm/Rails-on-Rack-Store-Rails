class Product < ActiveRecord::Base
  mount_uploader :image, ProductImageUploader

  paginates_per 2
  has_many :order_products
  has_many :orders, :through => :order_products

  validates :name, :description, :price, presence: true

  def convert_price(exchange_rate)
    self.price = self.price * exchange_rate
  end
end
