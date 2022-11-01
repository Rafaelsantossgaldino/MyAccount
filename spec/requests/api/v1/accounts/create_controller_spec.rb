require "rails_helper"

RSpec.describe Api::V1::Accounts::CreateController, type: :request do
  #let(:customer) { create(:customer) }
  let(:authorization) { '7CtRovRFCDOHgWYk6LomPR5j5cCkePAz87duqy' }

  context 'POST: method create' do
    it 'Should return account create' do
      byebug
      post 'api/v1/accounts/create/create_account', params: {
        authorization: authorization,
        customer_id: customer.id,
        name_bank: name_bank,
        agency: agency,
        num_account: num_account,
        balance: balance
      }
      expect(response).to have_http_status(:ok)
    end
  end
end
