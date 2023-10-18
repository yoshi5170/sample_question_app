Rails.application.routes.draw do
  root 'static_pages#top'
  get 'static_pages/top'
  resources :questions, only: [:index, :create] do
    collection do
      get :result
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
