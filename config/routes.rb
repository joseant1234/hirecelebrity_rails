Rails.application.routes.draw do

  devise_for :admins, controllers: { sessions: 'admins/sessions', passwords: 'admins/passwords' }

  namespace :admin do
  	root 'celebrities#index'
  	resources :celebrities, except: :destroy  do
      get 'wikipedia', on: :collection
      put 'status', on: :member
      resources :testimonials, shallow: true
    end
    resources :organizations, except: :destroy  do
      put 'status', on: :member
    end
    resources :clients, except: :destroy do
      put 'status', on: :member
      resources :testimonials, shallow: true
    end
    resources :services, except: :destroy do
      put 'status', on: :member
    end
  end
end
