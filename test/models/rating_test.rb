require "test_helper"

class RatingTest < ActiveSupport::TestCase
  setup do
    @rating = ratings(:two)
  end

  test "must be rating valid" do
    assert @rating.valid?
  end

  test "must be value more than 1 but less than 10" do
    assert (@rating.value >= 1 and @rating.value <= 10)
  end

  test "must be movie not nil" do
    @rating.movie = nil

    assert @rating.movie.nil?
    assert_not @rating.valid?
  end

  test "must be user not nil" do
    @rating.user = nil

    assert @rating.user.nil?
    assert_not @rating.valid?
  end
end
