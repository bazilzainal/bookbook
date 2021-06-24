require "application_system_test_case"

class ReadingListsTest < ApplicationSystemTestCase
  setup do
    @reading_list = reading_lists(:one)
  end

  test "visiting the index" do
    visit reading_lists_url
    assert_selector "h1", text: "Reading Lists"
  end

  test "creating a Reading list" do
    visit reading_lists_url
    click_on "New Reading List"

    fill_in "Name", with: @reading_list.name
    fill_in "User", with: @reading_list.user_id
    click_on "Create Reading list"

    assert_text "Reading list was successfully created"
    click_on "Back"
  end

  test "updating a Reading list" do
    visit reading_lists_url
    click_on "Edit", match: :first

    fill_in "Name", with: @reading_list.name
    fill_in "User", with: @reading_list.user_id
    click_on "Update Reading list"

    assert_text "Reading list was successfully updated"
    click_on "Back"
  end

  test "destroying a Reading list" do
    visit reading_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reading list was successfully destroyed"
  end
end
