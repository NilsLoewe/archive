Ziele::Application.routes.draw do
  devise_for :users, :path_prefix => 'my'

  resources :users
  resources :categories do
    member do
      get 'up'
      get 'down'
    end
  end

  resources :periodics do
    member do
      get 'instanciate'
    end
  end

  resources :objectives do
    member do
      get 'plan'
      get 'finish'
    end
  end

  resources :tasks do
    member do
      get 'no_week'
      get 'this_week'
    end
  end

  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/life"

  match '/plan',    to: 'weeks#week_plan'
  match '/show',    to: 'weeks#current_week'
  match '/finish',    to: 'weeks#finish_week'

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/life',    to: 'static_pages#life'
  match '/parked',  to: 'static_pages#parked'
  match '/archive', to: 'static_pages#archive'

  root :to => 'weeks#current_week'

end
