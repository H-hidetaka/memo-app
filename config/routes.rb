Rails.application.routes.draw do
  get 'home', to: 'home#index'
  # namespace を使っている背景としては、URLやファイル構成を指定のパスにしたいためですnamespace :api と記載しているため、コントローラーを作成する際はapiディレクトリを作成します。format: 'json' というコードでJSON形式に指定している
  namespace :api, format: 'json' do
    resources :memos, only: [:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
