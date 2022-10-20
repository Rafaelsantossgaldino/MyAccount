module Api
  module V1
    module Accounts
      class AccountsController < ApplicationController
        before_action :set_customer
        
        
        private

        def set_customer
          @customer = params[:customer_id]
        end
      end
    end
  end
end