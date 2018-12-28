Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'zip#show'

  resources :zip, only: [:index, :show]

  namespace :api do
  
    namespace :v1 do
      resources :zips, only: [:show]
    end

    match 'v:api/*path', :to => redirect("/api/v1/%{path}"), via: [:get]
    match '*path', :to => redirect("/api/v1/%{path}"), via: [:get]

  end

end
