Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: "api" do
    namespace :v1 do
      resources :transactions, only: :create
    end
  end
end
