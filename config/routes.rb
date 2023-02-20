Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    root 'pages#landingpage'
    get 'aboutus', to:'pages#aboutus'
    resources :articles
    resources :users

  # Defines the root path route ("/")
  # root "articles#index"
end
