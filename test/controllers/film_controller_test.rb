require 'vcr_setup'
require 'test_helper'

class FilmControllerTest < ActionController::TestCase
    test "should get index" do
        VCR.use_cassette("film controller tests") do
            get :index, :id => 1

            assert_response :success
            assert_not_nil assigns(:film)
        end
    end

    test "should set h1 to film title" do
        VCR.use_cassette("film controller tests") do
            get :index, :id => 1

            assert_select "h1", "A New Hope"
        end
    end

    test "should set opening crawl text" do
        VCR.use_cassette("film controller tests") do
            get :index, :id => 1

            assert_select ".crawl p", 3
        end
    end
end
