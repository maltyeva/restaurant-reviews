Rails.application.routes.draw do
  resources :restaurants do
    collection do
      get 'top', to: "restaurants#top"
      get 'worst', to: "restaurants#worst"
    end
    member do
      get 'chef', to: "restaurants#chef"
    end


    resources :reviews, shallow: true
  end


  # get 'restaurants/:id/chef', to "restaurants#chef", as: :chef_restaurant
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
