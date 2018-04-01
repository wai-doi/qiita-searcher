Rails.application.routes.draw do
  get 'searchers/free_search'
  get 'searchers/search'
  root 'searchers#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end