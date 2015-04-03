require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  describe "GET #index" do
    it "returns http 302" do
      get :index
      expect(response).to have_http_status(302)
    end
  end

end
