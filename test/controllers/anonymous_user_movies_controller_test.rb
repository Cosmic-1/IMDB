require "test_helper"

class AnonymousUserMoviesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get movies_url
    assert_response :success
  end

  test "should not get new and redirected to sign in" do

    get new_movie_url
    assert_response :redirect
  end

  test "should not create movie and redirected to sign in" do

    post movies_url, params: { movie: { title: @movie.title, body: @movie.body, category_id: @movie.category.id } }
    assert_response :redirect
  end

  test "should show movie" do

    get movie_url(@movie)
    assert_response :success
  end

  test "should not get edit and redirected to sign in" do

    get edit_movie_url(@movie)
    assert_response :redirect
  end

  test "should not update movie and redirected to sign in" do

    patch movie_url(@movie), params: { movie: { title: @movie.title, body: @movie.body, category_id: @movie.category.id } }
    assert_response :redirect
  end

  test "should not destroy movie and redirected to sign in" do

    delete movie_url(@movie)
    assert_response :redirect
  end
end
