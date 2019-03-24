Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "home#index"

  scope :users do
    get '/', to: 'users#index', as: :users
    get '/:id', to: 'users#show', as: :user
    post '/:id/follow', to: 'users#follow', as: :follow_user
    post '/:id/unfollow', to: 'users#unfollow', as: :unfollow_user
  end
end
