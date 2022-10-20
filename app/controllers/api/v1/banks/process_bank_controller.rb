module Api
  module V1
    module Banks
      class ProcessBankController < ApplicationController
        include Authenticable
        before_action :authenticate_with_token

        def registre_bank(customer_id, name_bank)
          
        end
      end
    end
  end
end
