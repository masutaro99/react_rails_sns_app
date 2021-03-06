# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# すべてのオリジンからのリクエストを許可する
# すべてのリソースに対して次のリクエストを許可する
# APIサーバに対するリクエストにどんなヘッダでもつけることを許可する
# methodsで指定したメソッドでのリソースへのアクセスを許可する

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3001'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end