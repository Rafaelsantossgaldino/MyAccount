module Api
  module V1
    module Accounts
      class TransferenciaController < ApplicationController
        include Authenticable
        before_action :authenticate_with_token
        before_action :set_customer

        def tranference_account
          return render nothing: true, status: :not_found if not @customer_id
          result = UseCase::Accounts::Transferencia.run(@customer_id, @name_bank, @agency, @num_account, @type, @new_balance_value)
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
          @type = params[:type]
          @new_balance_value = params[:new_balance_value]
        end
      end
    end
  end
end
