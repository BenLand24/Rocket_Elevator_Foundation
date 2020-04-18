Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  # devise_for :users
  devise_for :employees, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :pages
  resources :quote
  resources :leads

  root 'leads#new'

  get 'index' => 'leads#new' # index
  get 'corporate' => 'pages#corporate' # corporate
  get 'residential' => 'pages#residential' # residential
  get 'quoteform' => 'quote#new' # quote form
  get 'login' => 'pages#login'
  get 'sign_up' => 'users#sign_up'
  get 'sign_in' => 'users#sign_in'
  get 'leads' => 'leads#new'
  get 'welcome' => 'watson#welcome'
  
  post '/new_intervention' => 'interventions#new_intervention'
  post '/create_intervention' => 'interventions#create_intervention'
  post '/intervention_ticket' => 'interventions#intervention_ticket'


  resources :interventions do 
    get :get_building, on: :collection
    get :get_battery, on: :collection
    get :get_column, on: :collection
    get :get_elevator, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
