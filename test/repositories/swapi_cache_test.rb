require 'test_helper'
require 'swapi_cache'

class SwapiCacheTest < ActiveSupport::TestCase
    def setup
        SwapiCache.class_variable_set :@@people_cache, nil
        @cache = SwapiCache.new
    end

    test "should return all characters from api" do
        VCR.use_cassette "swapi cache tests" do
            assert_equal 87, @cache.people.length
        end
    end

    test "should convert character from hashes" do
        VCR.use_cassette "swapi cache tests" do
            @cache.people.each do |p|
                assert_not_nil p.url
            end
        end
    end

    test "should store people in people_cache" do
        VCR.use_cassette "swapi cache tests" do
            peopleCache = SwapiCache.class_variable_get :@@people_cache

            assert_nil peopleCache

            @cache.people

            peopleCache = SwapiCache.class_variable_get :@@people_cache

            assert_not_nil peopleCache
        end
    end
end
