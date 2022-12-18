require "test_helper"

class AnonymousUserCategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @category = categories(:one)
  end

  test "should get index" do

    get categories_url
    assert_response :success
  end

  test "should not get new and redirected to sign_in" do
      get new_category_url
      assert_response :redirect
  end

  test "should not create a category and redirected to sign_in" do
      post categories_url, params: { category: { title: @category.title  } }
      assert_response :redirect
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should not get edit and redirected to sign_in" do

      get edit_category_url(@category)
      assert_response :redirect
  end

  test "should not update a category and redirected to sign_in" do

      patch category_url(@category), params: { category: { title: @category.title  } }
      assert_response :redirect
  end

  test "should not destroy category and redirected to sign_in" do
      delete category_url(@category)
      assert_response :redirect
  end
end
