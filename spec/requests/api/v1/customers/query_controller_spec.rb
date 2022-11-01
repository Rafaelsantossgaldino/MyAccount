require "rails_helper"

RSpec.describe Api::V1::Customers::QueryController, type: :request do
  #let(:customer) { create(:customer) }
  let(:customer) { Customer.first }

  context 'GET: method query_customer' do
    byebug
    it 'Should return customer informations' do
      get 'api/v1/customers/query/query_customer', params: {
        customer_id: customer.id
      }
      expect(response).to have_http_status(:ok)
    end
  end
end
