Rails.application.routes.draw do
    resources :concerts
    get "/" => "concerts#home"
end
