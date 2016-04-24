ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  def clear_cache
      SwapiCache.class_variable_set :@@people_cache, nil
      SwapiCache.class_variable_set :@@films_cache, nil
  end
end
