require "application_system_test_case"

class AdminCategoriesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    @category = categories(:one)
    @admin = users(:admin)
  end

  test "visiting the index" do
    sign_in @admin
    visit categories_url
    assert_selector "h1", text: "Categories"
  end

  test "should create category" do
    sign_in @admin
    visit categories_url
    click_on "New category"

    fill_in "Title", with: @category.title

    click_on "Save"

    assert_text "Category was successfully created"

    click_on "Back"
  end

  test "should update Category" do
    sign_in @admin
    visit category_url(@category)
    click_on "Edit this category", match: :first

    fill_in "Title", with: @category.title

    click_on "Save"

    assert_text "Category was successfully updated"

    click_on "Back"
  end

  test "should destroy Category" do
    sign_in @admin
    visit category_url(@category)
    click_on "Destroy this category", match: :first

    assert_text "Category was successfully destroyed"
  end
end
