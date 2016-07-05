# Don't get fooled by SecureRandom.urlsafe_base64(16): This does not
# mean that the result will be 16 characters. It means that 16
# random bytes will be used to generate the urlsafe_base64 string.
# The result is about 4/3 larger.
TOKEN_REGEX = /[A-Za-z0-9\-_=]{16,24}/

Rails.application.routes.draw do
  root 'pages#index'

  resource :styleguide, only: [:show] if Rails.env.development?

  resources :decisions, only: [:create]

  resources :dashboards, param: :token, constraints: { token: TOKEN_REGEX }, only: [:show] do
    resources :options, only: [:new, :create, :edit, :update, :destroy]
    resources :assignments, only: [:edit, :update]
    resources :fact_ratings, only: [:update]
    resources :feelings, only: [:update]
    resources :decisions, only: [:edit, :update]
    resources :facts, only: [:new, :create, :edit, :update, :destroy]
    resources :participants, only: [:new, :create]
    resources :comments, only: [:new, :create]
    resources :images, only: [:new, :create, :destroy]
  end

  scope "(:locale)", locale: /de|en/ do
    get 'pages/imprint',    path: "imprint"
    get 'pages/privacy',    path: "privacy"
    get 'pages/admin',      path: "admin"
    get 'pages/prices',     path: "prices"
  end
end
