module Api
  module V1
    module Customer
      class ProcessCreateController < ApplicationController
        include Authenticable
        before_action :authenticate_with_token

        def registre_customer()
         
        end
      end
    end
  end
end
