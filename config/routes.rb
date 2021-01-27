Rails.application.routes.draw do
  get '/start_time' , to: 'schedules#start_time'
  get '/end_time', to: 'schedules#end_time'

  devise_for :users
  root 'pages#index'
  get 'pages/kanri'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
