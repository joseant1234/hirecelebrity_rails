Rails.application.routes.draw do

  devise_for :admins, controllers: { sessions: 'admins/sessions', passwords: 'admins/passwords' }

  namespace :admin do
  	root 'celebrities#index'
  	resources :celebrities do
      get 'wikipedia', on: :collection
      put 'status', on: :member
    end
  end
end
