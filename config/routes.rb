Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :accounts, default: { format: :json } do
        resources :process_account, only: :none do
          collection do
            post :registre_account
          end
        end
      end

      namespace :banks, default: { format: :json } do
        resources :modify, only: :none do
          collection do
            post :modify_bank
          end
        end
      end

      namespace :customers, default: { format: :json } do
        resources :query, only: :none do
          collection do
            get :query_customer
          end
        end
      end
    end
  end
end
