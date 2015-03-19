require 'rails_helper'
#require_relative '../../spec/spec_helper'

describe Order do

  let(:order_test) { Order.new(buyer: 'Tom', address: 'Kiev 25', email: 'tom@ruby.com') }

  it 'is not valid without a buyer' do
    order_test.buyer = nil
    expect(order_test).not_to be_valid
  end

  it 'is not valid without a address' do
    order_test.address = nil
    expect(order_test).not_to be_valid
  end

  it 'is not valid without a email' do
    order_test.email = nil
    expect(order_test).not_to be_valid
  end

  it 'is not valid without format a email' do
    order_test.email = 'nil.ruby.com'
    expect(order_test.errors_on(:email)).to include('is not an email')
  end
end
