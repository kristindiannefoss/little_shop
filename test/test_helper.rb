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

  def create_orders(num = 1, user_id)
    num.times do
      Order.create(
      user_id: user_id || User.all.sample.id
      )
    end
  end
end

  def create_user(num = 1)
    num.times do
      User.create(first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.safe_email,
      # address: "",
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zipcode: Faker::Address.zip_code,
      password: "password")
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
