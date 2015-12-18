AckRocketCmsCatalog::Engine.routes.draw do
  resources :items, only: [:show] do
    get '(/page/:page)', action: :index, on: :collection, as: ""
  end
  resources :item_categories, only: [:index, :show], path: "catalog" do
    get 'items(/page/:page)', action: :items, on: :member, as: :items
  end
  get 'catalog' => 'item_categories#index', as: :catalog
end
