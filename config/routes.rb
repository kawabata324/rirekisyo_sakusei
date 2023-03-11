Rails.application.routes.draw do
  resources :personal_histories, only: %i[index create update destroy] do
    resources :pdfs, only: :index, module: :personal_histories
    resource :profile, only: %i[show update destroy], module: :personal_histories
    resource :address, only: %i[show update destroy], module: :personal_histories
    resources :educational_back_grounds, only: %i[index update destory], module: :personal_histories
    resources :license_back_grounds, only: %i[index update destory], module: :personal_histories
    resources :programing_back_grounds, only: %i[index update destory], module: :personal_histories
    resources :internship_back_grounds, only: %i[index update destory], module: :personal_histories
  end
end
