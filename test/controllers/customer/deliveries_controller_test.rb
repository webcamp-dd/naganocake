require 'test_helper'

class Customer::DeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_deliveries_index_url
    assert_response :success
  end

  test "should get create" do
    get customer_deliveries_create_url
    assert_response :success
  end

  test "should get edit" do
    get customer_deliveries_edit_url
    assert_response :success
  end

  test "should get show" do
    get customer_deliveries_show_url
    assert_response :success
  end

  test "should get update" do
    get customer_deliveries_update_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_deliveries_destroy_url
    assert_response :success
  end

end
