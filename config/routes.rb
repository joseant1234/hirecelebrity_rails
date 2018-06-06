Rails.application.routes.draw do

  devise_for :admins, controllers: { sessions: 'admins/sessions', passwords: 'admins/passwords' }, skip: :registrations

  namespace :admin do
  	root 'celebrities#index'
  	resources :celebrities, except: :destroy  do
      get 'wikipedia', on: :collection
      put 'status', on: :member
      resources :testimonials, shallow: true
      resources :events, shallow: true
      resources :videos, shallow: true, except: [:show]
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
    resources :booking_topics, except: :destroy do
      put 'status', on: :member
    end
    resources :booking_requests, only: [:index, :show] do
      put 'status', on: :member
    end
    resources :sites, except: :destroy do
      resources :photographs, shallow: true
      member do
        put 'featured'
        put 'status'
      end
    end
    resources :categories, except: :destroy do
      put 'status', on: :member
    end
  end

  namespace :front, path: '' do
    root 'home#index'
    resources :celebrities, only: [:index, :show]
    resources :events, only: [:index]
    resources :services, only: [:index]
    resources :clients, only: [:index]
  end
end
