ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"

class CapybaraTestCase < MiniTest::Spec
  include Capybara::DSL
  register_spec_type(/page$/, self)
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def create_video
    visit videos_path
    click_on 'New Video'
    fill_in 'Title', with: 'Brandon Westgate first try Friday'
    fill_in 'Url', with: 'Tsu2CGtxUgU'
    click_on 'Create'
  end

  def create_second_video
    visit videos_path
    click_on 'New Video'
    fill_in 'Title', with: 'Bacon Pancakes NY Remix'
    fill_in 'Url', with: 'cUYSGojUuAU'
    click_on 'Create'
  end

  def create_post
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: 'Testing'
    fill_in 'Content', with: 'Hello World'
    click_on 'Create'
  end

  def create_second_post
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: "What's my name?"
    fill_in 'Content', with: 'Tyler Pottle'
    click_on 'Create'
  end
  # Add more helper methods to be used by all tests here...
end
