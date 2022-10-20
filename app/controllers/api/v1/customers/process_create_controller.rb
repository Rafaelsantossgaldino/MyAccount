module Api
  module V1
    module Customers
      class ProcessCreateController < ApplicationController
        include Authenticable
        before_action :authenticate_with_token
        before_action :set_customer, :create_bank

        def query_customer
          return render nothing: true, status: :not_found if not @customer_id
          result = UseCase::Customers::CreateUser.run(@customer_id)
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

        def create_bank
          customer = Customer.find(@customer_id)
          byebug
          customer.build_bank(name: "BANCO CENTRAL DE CONTAS.LT") if not customer.bank
          customer.bank.save
        end
      end
    end
  end
end
