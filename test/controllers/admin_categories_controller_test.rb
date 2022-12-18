require "test_helper"

class AdminCategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @category = categories(:one)
    @admin = users(:admin)
  end

  test "should get index" do
    sign_in @admin

    get categories_url
    assert_response :success
  end

  test "should get new" do
    sign_in @admin

    get new_category_url
    assert_response :success
  end

  test "should create category" do
    sign_in @admin

    assert_difference("Category.count") do
      post categories_url, params: { category: { title: @category.title  } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should show category" do
    sign_in @admin

    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    sign_in @admin

    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    sign_in @admin

    patch category_url(@category), params: { category: { title: @category.title  } }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do
    sign_in @admin

    assert_difference("Category.count", -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
end
