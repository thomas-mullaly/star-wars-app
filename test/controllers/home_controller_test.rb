require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get all 7 films" do
      get :index
      assert_not_nil assigns(:films)
      assert_equal 7, assigns(:films).length
  end

  test "should order all by films by episode id" do
      get :index

      for i in 0..6
          film = assigns(:films)[i]

          assert_equal i+1, film.episode_id
      end
  end

  test "should generate the correct film cards" do
      get :index

      assert_select ".film" do |cards|
          assert_equal 7, cards.length

          cards.each do |card|
              assert_select card, "a", 1
              assert_select card, "a img", 1
          end
      end
  end
end
