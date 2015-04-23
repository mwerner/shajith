Rails.application.routes.draw do
  get '/json'    => 'application#show', format: 'json'
  get '/:status' => 'application#update'

  root 'application#show'
end
