require 'test_helper'

class Admin::ProductCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_product_categories_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_product_categories_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_product_categories_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_product_categories_update_url
    assert_response :success
  end

end
