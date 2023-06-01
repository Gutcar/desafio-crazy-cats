Rails.application.routes.draw do 
  resources :articles do 
    resources :comments
    member do
      get 'show_and_new_comment', to: 'articles#show_and_new_comment', as: 'show_and_new_comment'
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  post '/reactions', to: 'reactions#user_reaction', as: 'user_reaction'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
end
