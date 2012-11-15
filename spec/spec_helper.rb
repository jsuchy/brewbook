require 'simplecov'
SimpleCov.start 'rails'

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'rspec/autorun'

require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
require 'support/mocks/base'
Dir[Rails.root+"spec/support/**/*.rb"].each {|f| require f}

module Helpers
  def has_properties(host, *props)
    props.each do |attr|
      it "has the propery #{attr}" do
        host.should respond_to(attr)
        host.method(attr).arity.should == 0
      end
    end
  end
end

RSpec.configure do |config|
  config.extend Helpers
  config.before(:suite) { DataMapper.auto_migrate! }

  config.before(:each) do
    repository(:default) do |repository|
      transaction = DataMapper::Transaction.new(repository)
      transaction.begin
      repository.adapter.push_transaction(transaction)
    end
  end

  config.after(:each) do
    repository(:default).adapter.pop_transaction.rollback
  end

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end
