Rails.application.routes.draw do
  resources :personal_histories, only: %i[index create update destroy] do
    resources :pdfs, only: :index, module: :personal_histories
    resource :profile, only: %i[show update destroy], module: :personal_histories
    resource :address, only: %i[show update destroy], module: :personal_histories
  end
end
