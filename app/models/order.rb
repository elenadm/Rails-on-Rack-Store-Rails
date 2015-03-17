class Order < ActiveRecord::Base
  belongs_to :product

  validates :buyer, :address, :email, presence: true
end
