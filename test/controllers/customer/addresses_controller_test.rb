require 'test_helper'

class Customer::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get customer_addresses_edit_url
    assert_response :success
  end

  test "should get create" do
    get customer_addresses_create_url
    assert_response :success
  end

  test "should get update" do
    get customer_addresses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_addresses_destroy_url
    assert_response :success
  end

end
