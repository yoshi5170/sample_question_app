Rails.application.routes.draw do
  root 'static_pages#top'
  get 'static_pages/top'
  resources :diagnosis_steps, only: [:show, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
