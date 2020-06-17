require 'test_helper'

class Customer::CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_cart_products_index_url
    assert_response :success
  end

  test "should get create" do
    get customer_cart_products_create_url
    assert_response :success
  end

  test "should get update" do
    get customer_cart_products_update_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_cart_products_destroy_url
    assert_response :success
  end

  test "should get all_destroy" do
    get customer_cart_products_all_destroy_url
    assert_response :success
  end

end
