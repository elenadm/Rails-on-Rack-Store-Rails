FactoryGirl.define do
  factory :order do
    buyer 'Tom'
    address 'Kiev 25'
    email 'tom@ruby.com'
  end

  factory :product do
    name 'blouse'
    description 'Bright top'
    price '10'
  end

  factory :order_with_product, parent: :order do
    ignore do
      product { FactoryGirl.create(:product) }
    end

    after(:create) do |order, evaluator|
      order.products << evaluator.product
    end
  end
end