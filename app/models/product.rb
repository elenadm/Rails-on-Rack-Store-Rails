class Product < ActiveRecord::Base
  has_many :orders
  validates :name, :description, :image_url, :price, presence: true

  def convert_price(exchange_rate)
    self.price = self.price * exchange_rate
  end
end
