Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :account, default: { format: :json } do
        resources :process_account, only: :none do
          collection do
            post :registre_account
          end
        end
      end

      namespace :bank, default: { format: :json } do
        resources :process_bank, only: :none do
          collection do
            post :registre_bank
          end
        end
      end

      namespace :customer, default: { format: :json } do
        resources :process_create, only: :none do
          collection do
            post :registre_customer
          end
        end
      end
    end
  end
end
