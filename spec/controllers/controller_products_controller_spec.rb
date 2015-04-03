require 'rails_helper'

RSpec.describe ProductsController do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    it "render product" do
      product1_test = FactoryGirl.create(:product)
      get :show, id: product1_test.id
      expect(response).to be_success
    end
  end
end
