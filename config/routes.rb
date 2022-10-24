Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :accounts, default: { format: :json } do
        resources :create, only: :none do
          collection do
            post :create_account
          end
        end
      end

      namespace :accounts, default: { format: :json } do
        resources :deposit, only: :none do
          collection do
            post :deposit_account
          end
        end
      end

      namespace :accounts, default: { format: :json } do
        resources :saldo, only: :none do
          collection do
            get :saldo_account
          end
        end
      end

      namespace :accounts, default: { format: :json } do
        resources :saques, only: :none do
          collection do
            post :saque_account
          end
        end
      end

      namespace :accounts, default: { format: :json } do
        resources :extrato, only: :none do
          collection do
            get :extrato_customer
          end
        end
      end

      namespace :accounts, default: { format: :json } do
        resources :transferencia, only: :none do
          collection do
            post :tranference_account
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
