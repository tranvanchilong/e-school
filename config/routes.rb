Rails.application.routes.draw do
  get 'exams/new'
  
  scope "(:locale)", locale: /en|vi/ do
    # get "classes"
    get "classes/index"
    get "classes/room"
    get "classes/admin"
    get "classes/destroy"
    resources :classes
    get "classes/new"
    get "classes/user_class"
    get "courses/admin"
    resources :courses
    get "courses/new"

    resources :user_classes
    resources :user_courses
    get "static_pages/exam"
    get "static_pages/admin"
    get "users/friends"
    get "users/teachers"
    get "static_pages/introduce"
    get "static_pages/metaverse"
    root "static_pages#index"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    concern :imageable do
      resources :images, only: :create
    end
    resources :users, concerns: [:imageable]
    resources :users do
      member do
        get "/selecting", to: "examcarts#selecting"
      end
    end
    resources :microposts
    namespace :admin do
      resources :users
      resources :statistics, only: [:index]
      resources :historys, only: [:index]
      resources :exams do
        resources :questions do
          resources :answers
        end
      end
    end
    namespace :client do
      resources :user_history_exams
      resources :exams do
        resources :result_exams
        resources :history_do_exams
        resources :questions do
          resources :answers
        end
      end
    end
    resources :achiviements, only: [:index]
    resources :account_activations, only:[:edit]
    resources :password_resets
    resources :examcarts, only: [:show_select, :create, :destroy]
    resources :classes 
    resources :static_pages, only: [:create, :destroy]
    resources :exam_details, only: [:index]
    resources :comments, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    resources :star_ratings
    resources :users
  end
end
