module Api
  module V1
    module Customers
      class QueryController < ApplicationController
        include Authenticable
        before_action :authenticate_with_token
        before_action :set_customer, :create_accounts

        def query_customer
          return render nothing: true, status: :not_found if not @customer_id
          result = UseCase::Customers::QueryCustomer.run(@customer_id)
          if result
            render json: result, status: :ok
          else
            render nothing: true, status: :bad_request
          end
        end

        private

        def set_customer
          @customer_id = params[:customer_id]
        end

        def create_accounts
          customer = Customer.find(@customer_id)
          customer.accounts.create({name_bank: "Nubak", agency: "1000", num_account: "369258", balance: 50}) if customer.accounts.empty?
        end
      end
    end
  end
end
