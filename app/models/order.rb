class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || 'is not an email') unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end
end

class Order < ActiveRecord::Base
  include ActiveModel::Validations
  has_many :order_products
  has_many :products, :through => :order_products

  validates :buyer, :address, :email, presence: true
  validates :email, presence: true, email: true
  #validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: 'is not an email'}
end
