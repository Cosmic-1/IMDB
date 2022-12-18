require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(email: Faker::Internet.email, password: Faker::Internet.password(min_length: 6))
    @movie = movies(:one)
  end

  test "must be valid for the user" do
    assert @user.valid?
  end

  test "must be valid for the email" do
    @user.email = ''
    assert_not @user.valid?
  end

  test "must be valid for the password" do
    @user.password = '12345'
    assert_not @user.valid?
  end

  test "user can rate" do
    assert @user.can_rate?(@movie)
  end

  test "user can not rate" do
    Rating.create(user: @user, movie: @movie,value: 10)

    assert_not @user.can_rate?(@movie)
  end
end
