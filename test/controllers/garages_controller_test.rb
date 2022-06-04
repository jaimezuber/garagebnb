require "test_helper"

class GaragesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get garages_index_url
    assert_response :success
  end

  test "should get show" do
    get garages_show_url
    assert_response :success
  end

  test "should get new" do
    get garages_new_url
    assert_response :success
  end

  test "should get create" do
    get garages_create_url
    assert_response :success
  end

  test "should get edit" do
    get garages_edit_url
    assert_response :success
  end

  test "should get update" do
    get garages_update_url
    assert_response :success
  end

  test "should get delete" do
    get garages_delete_url
    assert_response :success
  end
end
