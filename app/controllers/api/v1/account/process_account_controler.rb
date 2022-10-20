module Api
  module V1
    module Account
      class ProcessAccountController < ApplicationController
        include Authenticable
        before_action :authenticate_with_token

        def registre_account()
          
        end
      end
    end
  end
end
