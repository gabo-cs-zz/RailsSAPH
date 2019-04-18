Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
        get 'user/genders', to: 'users#genders'
        resources :users, :headquarters
    end
  end
end
