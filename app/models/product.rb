class Product < ActiveRecord::Base
  has_many :orders
  validates :name, :description, :image_url, :price, presence: true

  def self.convert_price(pr, exchange_rate)
    pr.price = pr.price * exchange_rate
  end
end
