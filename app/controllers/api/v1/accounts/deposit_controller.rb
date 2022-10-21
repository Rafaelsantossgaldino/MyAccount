module Api
  module V1
    module Accounts
      class DepositController < ApplicationController
        include Authenticable
        before_action :authenticate_with_token
        before_action :set_customer

        def deposit_account
          return render nothing: true, status: :not_found if not @customer_id
          result = UseCase::Accounts::Deposit.run(@customer_id, params[:new_value_name], params[:new_value_agency], params[:new_value_num_account], params[:new_value_balance])
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
      end
    end
  end
end
