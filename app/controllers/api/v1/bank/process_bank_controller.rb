module Api
  module V1
    module Bank
      class ProcessBankController < ApplicationController
        include Authenticable
        before_action :authenticate_with_token
        
        def registre_bank()
          
        end
      end
    end
  end
end
