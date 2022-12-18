require "test_helper"

class MovieTest < ActiveSupport::TestCase
  setup do
    @category = categories(:one)
    @movie = movies(:one)
    @user = users(:admin)
  end

  test "must be valid for the movie" do
    assert @movie.valid?
  end

  test "valid title and body" do
    assert (@movie.title.length > 2) and (@movie.body.length > 2)
  end

  test "check the value of method 'to_param'" do
    assert @movie.to_param == "#{@movie.id}-#{@movie.title.parameterize}"
  end

  test "check the method 'rating_average'" do
    rating = Rating.create(user: @user, value: 10, movie: @movie)

    assert_not @movie.rating_average == 0
  end

  test "upload image" do
    @movie.poster.attach(io: File.open(file_fixture('image_1.jpg')),
                         filename: 'image_1.jpg',
                         content_type: 'application/jpg')
    assert @movie.poster.attached?
  end

end
