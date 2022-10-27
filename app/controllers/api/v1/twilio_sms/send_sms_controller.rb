module Api
  module V1
    module TwilioSms
      class SendSmsController < ApplicationController
        include Authenticable
        before_action :authenticate_with_token

        def submit_sms
          byebug
          result = SmS::SendSms.run(params)
          if result
            render json: result, status: :ok
          else
            render nothing: true, status: :bad_request
          end
        end
      end

      private

      def send_sms_params
        params.permit(:authorization, data: [:name_bank, :agency, :num_account, :balance])
      end
    end
  end
end
