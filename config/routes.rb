Rails.application.routes.draw do
  get 'schedules_admin/index',to: 'schedules_admin#index'

  devise_for :admins, controllers: {
    sessions:  'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  
   devise_for :users, controllers: {
     sessions: 'users/sessions',
     passwords: 'users/passwords',
     registrations: 'users/registrations'
   }
  get '/schedules/start_time' , to: 'schedules#start_time'
  get '/schedules/end_time', to: 'schedules#end_time'
  get '/schedules/my_index', to: 'schedules#my_index'


 
  root 'pages#home'
  get 'pages/user_page'
  get 'pages/kanri'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
