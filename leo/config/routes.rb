Rails.application.routes.draw do

  devise_for :users  

  namespace :api, defaults: {format: :json} do
    devise_scope :user do
      resource :session, only: [:create, :destroy]
    end
    resources :hats, only: [:index, :create, :update, :destroy, :show]
  end


  get '/overview' => 'templates#index'
  get '/hats/:id' => 'templates#index'
  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/ }

  root 'static_pages#index'
end
