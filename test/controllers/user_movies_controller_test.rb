require "test_helper"

class UserMoviesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @movie = movies(:one)
    @s_user = users(:simple_user)
  end

  test "should get index" do
    sign_in @s_user

    get movies_url
    assert_response :success
  end

  test "should not get new" do
    sign_in @s_user

    assert_raise CanCan::AccessDenied do
      get new_movie_url
    end
  end

  test "should not create movie" do
    sign_in @s_user
    assert_raise CanCan::AccessDenied do
      post movies_url, params: { movie: { title: @movie.title, body: @movie.body, category_id: @movie.category.id } }
    end
  end

  test "should show movie" do
    sign_in @s_user
    get movie_url(@movie)
    assert_response :success
  end

  test "should not get edit" do
    sign_in @s_user
    assert_raise CanCan::AccessDenied do
      get edit_movie_url(@movie)
    end
  end

  test "should not update movie" do
    sign_in @s_user
    assert_raise CanCan::AccessDenied do
      patch movie_url(@movie), params: { movie: { title: @movie.title, body: @movie.body, category_id: @movie.category.id } }
    end
  end

  test "should not destroy movie" do
    sign_in @s_user

    assert_raise CanCan::AccessDenied do
      delete movie_url(@movie)
    end
  end
end
