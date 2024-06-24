require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SandboxAppBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    config.middleware.use ActionDispatch::Cookies

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # Railsのアプリケーション上で表示したい時間の基準となるタイムゾーンを指定する
    # このタイムゾーンはOSとは独立している。
    # しかし基本的にはアプリケーションのタイムゾーンはOSのタイムゾーンと合わせておくのが安全。。
    config.time_zone = "Tokyo"

    # 余計なモデルスペックとか必要なファクトリーを生成したくないからfalseを設定
    config.generators do |g|
      g.test_framework false
    end
  end
end
