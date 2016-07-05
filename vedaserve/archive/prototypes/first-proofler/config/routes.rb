VedaScan::Application.routes.draw do

  devise_for :users

  resources :users
  resources :researches do
    member do
      get 'select'
      get 'export'
    end
  end

  resources :topics
  resources :questions do
    resources :terms
    resources :searches
    resources :knowledges, controller: 'searches', type: 'Knowledge'
    resources :web_searches, controller: 'searches', type: 'WebSearch'
    resources :database_searches, controller: 'searches', type: 'DatabaseSearch'
    resources :library_searches, controller: 'searches', type: 'LibrarySearch'
    resources :interviews, controller: 'searches', type: 'Interview'
    resources :surveys, controller: 'searches', type: 'Survey'
    member do
      post 'enable'
      get 'answer_process'
      get 'answer_describe'
      get 'answer_improve'
      get 'answer_gather'
      get 'answer_analyze'
      get 'answer_shape'
    end
  end
  resources :dataobjects
  resources :books, controller: 'dataobjects', type: 'Book'
  resources :links, controller: 'dataobjects', type: 'Link'
  resources :persons, controller: 'dataobjects', type: 'Person'
  resources :sources
  resources :hints

  resources :styleguide

  get '/admin',   to: 'static_pages#admin'
  get '/help',    to: 'static_pages#help'
  get '/about',   to: 'static_pages#about'

  root :to => 'static_pages#home'

end
