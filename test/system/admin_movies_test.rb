require "application_system_test_case"

class AdminMoviesTest < ApplicationSystemTestCase
 include Devise::Test::IntegrationHelpers
  setup do
    @movie = movies(:one)
    @admin = users(:admin)
  end

  test "visiting the index" do
    sign_in @admin
    visit movies_url
    assert_selector "h1", text: "Movies"
  end

  test "should create movie" do
    sign_in @admin
    visit movies_url
    click_on "New movie"


    fill_in "Title", with: @movie.title
    fill_in "Body", with: @movie.body

    click_on "Save"

    assert_text "Movie was successfully created"
    click_on "Back"
  end

  test "should update Movie" do
    sign_in @admin
    visit movie_url(@movie)
    click_on "Edit this movie", match: :first

    fill_in "Body", with: @movie.body
    fill_in "Title", with: @movie.title

    click_on "Save"

    assert_text "Movie was successfully updated"
    click_on "Back"
  end

  test "should destroy Movie" do
    sign_in @admin
    visit movie_url(@movie)
    click_on "Destroy this movie", match: :first

    assert_text "Movie was successfully destroyed"
  end
end
