require 'vcr_setup'
require 'test_helper'

class FilmControllerTest < ActionController::TestCase
    def setup
        clear_cache
    end

    test "should get index" do
        VCR.use_cassette("film controller tests") do
            get :index, :id => 1

            assert_response :success
            assert_not_nil assigns(:film)
            assert_not_nil assigns(:characters)
        end
    end

    test "should load correct film" do
        VCR.use_cassette("film controller tests") do
            get :index, :id => 1

            film = assigns(:film)

            assert_equal 4, film.episode_id
            assert_equal "A New Hope", film.title
        end
    end

    test "should return only characters for film" do
        VCR.use_cassette("film controller tests") do
            get :index, :id => 4

            film = assigns(:film)
            characters = assigns(:characters)

            assert_equal 34, characters.length
            assert_equal true, characters.all? { |c| c.films.include? film.url }
        end
    end

    test "should generate character card for each character" do
        VCR.use_cassette("film controller tests") do
            get :index, :id => 4

            assert_select ".character", 34
        end
    end
end
