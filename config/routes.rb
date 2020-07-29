Rails.application.routes.draw do
  resources :restaurants do
    collection do
      get 'top'
      get 'worst'
    end
    member do
      get 'chef'
    end
    resources :reviews, shallow: true
  end
  # resources :reviews, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
