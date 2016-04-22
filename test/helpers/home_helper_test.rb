require 'test_helper'

class HomeHelperTest < ActionView::TestCase
    include HomeHelper

    test "should correctly parse film id off url" do
        url = "http://swapi.co/api/films/1"

        result = parse_film_id(url)

        assert_equal "1", result
    end
end
