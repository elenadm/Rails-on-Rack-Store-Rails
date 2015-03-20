require_relative '../../spec/spec_helper'

describe Product do

  let(:product1_test) { FactoryGirl.create(:product) }

  it { expect have_many(:orders) }

  it 'has a valid factory product' do
    expect(product1_test).to be_valid
  end

  it 'is not valid without a name' do
    product1_test.name = nil
    expect(product1_test).not_to be_valid
  end

  it 'is not valid without a description' do
    product1_test.description = nil
    expect(product1_test).not_to be_valid
  end

  it 'is not valid without a price' do
    product1_test.price = nil
    expect(product1_test).not_to be_valid
  end

  it 'is not valid without a image_url' do
    product1_test.image_url = nil
    expect(product1_test).not_to be_valid
  end

  it 'convert price' do
    expect(product1_test.convert_price(20)).to eq (200)
  end
end