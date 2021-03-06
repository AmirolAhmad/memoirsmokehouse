Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks'
  }
  devise_scope :user do
    get '/login' => 'users/sessions#new'
    get '/register' => 'users/registrations#new'
    get '/settings' => 'users/registrations#edit'
  end
  resources :orders, only: [:new, :create, :show]
  root 'homepage#index'
  get '/menu' => 'homepage#menu'
  get '/contact' => 'homepage#contact'
  namespace :admin, path: '/master' do
    get "/" => "dashboard#index", as: 'master'
    resources :menus, except: [:show]
    resources :orders, except: [:new, :create, :edit, :update] do
      member do
        patch :mark_preparing
        patch :mark_delivering
        patch :mark_delivered
        patch :mark_cancelled
        patch :mark_paid
        patch :mark_unpaid
      end
    end
    resources :promocodes, except: [:show]
    resources :delivery_dates, except: [:show] do
      member do
        patch :mark_inactive
      end
    end
  end
  get '/order' => 'orders#search', as: 'search'
end
