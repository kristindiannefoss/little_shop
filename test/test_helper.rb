ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/setup'
require 'capybara/rails'
require 'database_cleaner'

class ActiveSupport::TestCase
  def create_categories(num = 1)
    num.times do
      Category.create(name: Faker::Commerce.department(1))
    end
  end

  def create_items(num = 1)
    num.times do
      Item.create(
      name: Faker::Commerce.product_name,
      description: Faker::Hipster.sentence(6),
      image_url: Faker::Placeholdit.image("150x150"),
      price: Faker::Commerce.price,
      category_id: Category.all.sample.id)
    end
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  DatabaseCleaner.strategy = :transaction
  DatabaseCleaner.clean_with(:truncation)

  def setup
    DatabaseCleaner.start
  end
  def teardown
    reset_session!
    DatabaseCleaner.clean
  end
end
