require "application_system_test_case"

class BackgroundsTest < ApplicationSystemTestCase
  setup do
    @background = backgrounds(:one)
  end

  test "visiting the index" do
    visit backgrounds_url
    assert_selector "h1", text: "Backgrounds"
  end

  test "creating a Background" do
    visit backgrounds_url
    click_on "New Background"

    fill_in "Name", with: @background.name
    click_on "Create Background"

    assert_text "Background was successfully created"
    click_on "Back"
  end

  test "updating a Background" do
    visit backgrounds_url
    click_on "Edit", match: :first

    fill_in "Name", with: @background.name
    click_on "Update Background"

    assert_text "Background was successfully updated"
    click_on "Back"
  end

  test "destroying a Background" do
    visit backgrounds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Background was successfully destroyed"
  end
end
