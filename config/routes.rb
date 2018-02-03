Rails.application.routes.draw do
  get 'welcome/index'
  scope module: :web do
    resources :articles do
      member do
        patch :moderate
      end
      scope module: :articles do
        resources :comments
      end
    end
    namespace :moderation do
      resources :articles
    end

    root 'welcome#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
