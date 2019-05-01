Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
        get 'user/genders', to: 'users#genders'
        post 'authenticate', to: 'authentication#authenticate'
        resources :users, :headquarters
    end
  end
end
