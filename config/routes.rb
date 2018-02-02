Rails.application.routes.draw do
  get 'welcome/index'
  scope module: :web do
    resources :articles do
      scope module: :articles do
        resources :comments
      end
    end

    root 'welcome#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
