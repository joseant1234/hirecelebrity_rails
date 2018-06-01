Rails.application.routes.draw do
  
  devise_for :admins, controllers: { sessions: 'admins/sessions', passwords: 'admins/passwords' }
  
  namespace :admin do
  	root 'celebrities#index'
  	resources :celebrities
  end
end
