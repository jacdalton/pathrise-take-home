Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  get '/:name', to: 'pages#job_board', as: :job_board
end
