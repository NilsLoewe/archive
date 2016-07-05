DmcPrototype::Application.routes.draw do
  
  resources :allocations do
    member do
      get 'valid'    
      get 'invalid'   
      get 'irrelevant' 
    end
  end

  resources :options do
    member do
      get 'select'
      get 'unselect'
    end
  end

  resources :decisions do
    member do
      get 'general'
      get 'options' 
      get 'settings'
      get 'invite'
      get 'done'
      get 'evaluate'
      get 'facts'
      get 'decide'
      get 'review'
      get 'participate'
      get 'duplicate' 
      get 'copy'
      post 'close'
    end
  end

  resources :participants do
    resources :options
    resources :facts
    member do
      get 'dashboard'
      get 'start'
      get 'comments'
      get 'show_options'
      get 'show_facts'
      get 'evaluate'
      get 'invite'
      get 'decide'
    end
  end

  resources :facts do
    member do
      get 'pos'    
      get 'neg'   
      get 'binary'
      get 'discrete' 
      get 'range'
    end
  end

  resources :images
  resources :guts
  resources :ratings
  resources :arguments
  resources :keywords
  resources :users
  resources :dmc
  resources :comments
  resources :option_assets
  resources :fact_assets
  resources :fact_ratings
  resources :searches

  get 'dmc/status', :path => "status"
  root 'dmc#home'
  
end
