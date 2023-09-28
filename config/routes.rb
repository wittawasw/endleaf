Rails.application.routes.draw do
  scope module: 'endleaf' do
    get '/pages/:page', to: 'pages#show', as: :page
  end
end
