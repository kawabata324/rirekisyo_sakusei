Rails.application.routes.draw do
  resources :personal_histories, only:  %i[index create update destroy] do
    resource :profile, only: %i[show update destroy], module: :personal_histories
  end
end
