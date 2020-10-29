Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/signup', to: 'pages#signup', as: 'signup' do
    put "create", on: :user
  end
  resources :team, only: [:index], :as => 'team'
  resources :contact, only: [:index]
  resources :potins
  resources :user
  resources :sessions, only:[:new, :create, :destroy]
  resources :like, only:[:new, :create, :destroy]
end

# Prefix    Verb    URI                                                                                     Controller#
#           POST   /potins(.:format)                                                                        potins#create
# new_potin GET    /potins/new(.:format)                                                                    potins#new