# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

Rails.root.glob('spec/support/**/*.rb').sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.include RSpec::JsonMatcher
  config.include Committee::Rails::Test::Methods
  config.include ActiveSupport::Testing::TimeHelpers # 追加

  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods

  config.filter_run_when_matching :focus

  #　この2行を入れるだけでRailsでcommitiee-railsが使えるようになる
  config.add_setting :committee_options
  config.committee_options = {
    schema_path: Rails.root.join("api", "schemas", "sandbox_app_backend_api.yaml").to_s,
  }
end
