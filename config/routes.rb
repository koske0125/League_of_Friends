Rails.application.routes.draw do
  # 顧客用
# URL /customers/sign_in ...
devise_for :user, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'public/homes#index'

  namespace :public, path: "" do
    resources :users, only: [:edit, :update]
  end
end
