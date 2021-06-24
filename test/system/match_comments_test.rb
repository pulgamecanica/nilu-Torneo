require "application_system_test_case"

class MatchCommentsTest < ApplicationSystemTestCase
  setup do
    @match_comment = match_comments(:one)
  end

  test "visiting the index" do
    visit match_comments_url
    assert_selector "h1", text: "Match Comments"
  end

  test "creating a Match comment" do
    visit match_comments_url
    click_on "New Match Comment"

    fill_in "Descrption", with: @match_comment.descrption
    fill_in "Match", with: @match_comment.match_id
    click_on "Create Match comment"

    assert_text "Match comment was successfully created"
    click_on "Back"
  end

  test "updating a Match comment" do
    visit match_comments_url
    click_on "Edit", match: :first

    fill_in "Descrption", with: @match_comment.descrption
    fill_in "Match", with: @match_comment.match_id
    click_on "Update Match comment"

    assert_text "Match comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Match comment" do
    visit match_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Match comment was successfully destroyed"
  end
end
