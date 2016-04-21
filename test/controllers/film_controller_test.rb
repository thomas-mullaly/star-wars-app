require 'test_helper'

class FilmControllerTest < ActionController::TestCase
    test "should get index" do
        get :index, :id => 1

        assert_response :success
        assert_not_nil assigns(:film)
    end

    test "should set h1 to film title" do
        get :index, :id => 1

        assert_select "h1", "A New Hope"
    end

    test "should set opening crawl text" do
        get :index, :id => 1

        assert_select ".crawl p", 3
    end
end
