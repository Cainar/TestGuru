Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests, shallow: true do
  	resources :questions
  end

  get 'tests/:test_id/questions/:id', to: 'questions#show'
end
