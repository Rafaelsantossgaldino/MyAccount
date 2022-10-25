module Api
  module V1
    module Accounts
      class TransferenciaController < ApplicationController
        include Authenticable
        before_action :authenticate_with_token
        before_action :set_customer

        def tranference_account
          return render nothing: true, status: :not_found if not @customer_id
          result = UseCase::Accounts::Transferencia.run(@customer_id, @source_account_id, @destination_account_id, @amount)
          if result[:success]
            render json: { message: result[:message] }, status: :ok
          else
            render json: { message: result[:message] }, status: :bad_request
          end
        end

        private

        def set_customer
          @customer_id = params[:customer_id]
          @source_account_id = params[:source_account_id]
          @destination_account_id = params[:destination_account_id]
          @amount = params[:amount]
        end
      end
    end
  end
end
