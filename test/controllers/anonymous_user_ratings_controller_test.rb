class AnonymousUserRatingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @movie = movies(:one)
  end

  test "can not anonymous send rate" do
    post movie_ratings_url(@movie), params: { value: 10  }
    assert_response :redirect
  end
end