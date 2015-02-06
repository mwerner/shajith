Rails.application.routes.draw do
  get '/:status' => 'application#update'
  root 'application#show'
end
