ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require "support/test_password_helper"

class ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  include TestPasswordHelper

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  ActiveRecord::FixtureSet.context_class.send :include, TestPasswordHelper
end
