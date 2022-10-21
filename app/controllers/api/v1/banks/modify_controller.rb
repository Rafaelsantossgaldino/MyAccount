module Api
  module V1
    module Banks
      class ModifyController < ApplicationController
        include Authenticable

        before_action :authenticate_with_token
        before_action :set_customer

        def modify_bank
          return render nothing: true, status: :not_found if not @customer_id
          result = UseCase::Banks::ModifyName.run(@customer_id, params[:new_name_bank])
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
