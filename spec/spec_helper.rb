require 'rubygems'
require 'bundler/setup'
require 'simplecov'
require 'rspec'
require 'fuubar'
SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.mock_with :rspec do |c|
    c.syntax = :expect
  end
end