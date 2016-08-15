Rails.application.routes.draw do
  root 'trace_routes#index'
  resource :trace_routes, only: [ :index, :create ]
end
