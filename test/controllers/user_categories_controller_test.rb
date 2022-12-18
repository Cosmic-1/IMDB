require "test_helper"

class UserCategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @category = categories(:one)
    @s_user = users(:simple_user)
  end

  test "should get index" do
    sign_in @s_user

    get categories_url
    assert_response :success
  end

  test "should not get new" do
    sign_in @s_user
    assert_raise CanCan::AccessDenied do
      get new_category_url
    end
  end

  test "should not create category" do
    sign_in @s_user

    assert_raise CanCan::AccessDenied do
      post categories_url, params: { category: { title: @category.title  } }
    end
  end

  test "should show category" do
    sign_in @s_user

    get category_url(@category)
    assert_response :success
  end

  test "should not get edit" do
    sign_in @s_user

    assert_raise CanCan::AccessDenied do
      get edit_category_url(@category)
    end
  end

  test "should not update category" do
    sign_in @s_user

    assert_raise CanCan::AccessDenied do
      patch category_url(@category), params: { category: { title: @category.title  } }
    end
  end

  test "should not destroy category" do
    sign_in @s_user

    assert_raise CanCan::AccessDenied do
      delete category_url(@category)
    end
  end
end
