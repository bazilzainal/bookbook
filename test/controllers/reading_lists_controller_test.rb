require "test_helper"

class ReadingListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reading_list = reading_lists(:one)
  end

  test "should get index" do
    get reading_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_reading_list_url
    assert_response :success
  end

  test "should create reading_list" do
    assert_difference('ReadingList.count') do
      post reading_lists_url, params: { reading_list: { created_at: @reading_list.created_at, name: @reading_list.name } }
    end

    assert_redirected_to reading_list_url(ReadingList.last)
  end

  test "should show reading_list" do
    get reading_list_url(@reading_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_reading_list_url(@reading_list)
    assert_response :success
  end

  test "should update reading_list" do
    patch reading_list_url(@reading_list), params: { reading_list: { created_at: @reading_list.created_at, name: @reading_list.name } }
    assert_redirected_to reading_list_url(@reading_list)
  end

  test "should destroy reading_list" do
    assert_difference('ReadingList.count', -1) do
      delete reading_list_url(@reading_list)
    end

    assert_redirected_to reading_lists_url
  end
end
