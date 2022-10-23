module Api
  module V1
    module Accounts
      class DepositController < ApplicationController
        include Authenticable
        before_action :authenticate_with_token
        before_action :set_customer

        def deposit_account
          return render nothing: true, status: :not_found if not @customer_id
          result = UseCase::Accounts::Deposit.run(@customer_id, @name_bank, @agency, @num_account, params[:new_balance_value].to_i)
          if result
            render json: result, status: :ok
          else
            render nothing: true, status: :bad_request
          end
        end

        private

        def set_customer
          @customer_id = params[:customer_id]
          @name_bank = params[:name_bank]
          @agency = params[:agency]
          @num_account = params[:num_account]
        end
      end
    end
  end
end
