Rails.application.routes.draw do
  resources :decimals
  root to: 'welcomes#index'
  get 'balanceds' => 'balanceds#check'
  post 'balanceds' => 'balanceds#check'
end
