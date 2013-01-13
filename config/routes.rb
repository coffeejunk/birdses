Birdses::Engine.routes.draw do
  resources :pages do
    match '/preview' => 'pages#preview', via: :post
  end
  root to: "pages#index"
end
