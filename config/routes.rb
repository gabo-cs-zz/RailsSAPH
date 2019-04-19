Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
        get 'user/genders', to: 'users#genders'
        post 'auth/login', to: 'users#login'
        post 'auth/logout', to: 'users#logout'

        resources :users, :headquarters
    end
  end
end
