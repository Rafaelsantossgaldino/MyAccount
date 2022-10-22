module Api
  module V1
    module Accounts
      class ExtratoController < ApplicationController
        include Authenticable
        before_action :authenticate_with_token
        before_action :set_customer

        def extrato_customer
          return render nothing: true, status: :not_found if not @customer_id
          result = UseCase::Accounts::Extrato.run(@customer_id)
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
