require "test_helper"

class UserRatingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @movie = movies(:one)
    @user = users(:simple_user)
  end

  test "can user send rate" do
    sign_in @user

    post movie_ratings_url(@movie), params: { value: 10  }
    assert_response :success
  end

  test "user send rate less" do
    sign_in @user

    post movie_ratings_url(@movie), params: { value: -1  }
    assert_response :bad_request
  end

  test "user send rate not value" do
    sign_in @user

    post movie_ratings_url(@movie)
    assert_response :bad_request
  end
end
