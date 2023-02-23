Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    root 'pages#landingpage'
    get 'aboutus', to:'pages#aboutus'
    resources :articles
    resources :users, except:[:new]
    get 'signup', to:'users#new'
    get 'login' , to:'sessions#new'
    post 'login', to:'sessions#create'
    delete 'logout', to:'sessions#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
end
