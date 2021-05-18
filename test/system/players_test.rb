require "application_system_test_case"

class PlayersTest < ApplicationSystemTestCase
  setup do
    @player = players(:one)
  end

  test "visiting the index" do
    visit players_url
    assert_selector "h1", text: "Players"
  end

  test "creating a Player" do
    visit players_url
    click_on "New Player"

    fill_in "Age", with: @player.age
    fill_in "Bio", with: @player.bio
    fill_in "Birthday", with: @player.birthday
    fill_in "Likes", with: @player.likes
    fill_in "Name", with: @player.name
    fill_in "Rank", with: @player.rank
    click_on "Create Player"

    assert_text "Player was successfully created"
    click_on "Back"
  end

  test "updating a Player" do
    visit players_url
    click_on "Edit", match: :first

    fill_in "Age", with: @player.age
    fill_in "Bio", with: @player.bio
    fill_in "Birthday", with: @player.birthday
    fill_in "Likes", with: @player.likes
    fill_in "Name", with: @player.name
    fill_in "Rank", with: @player.rank
    click_on "Update Player"

    assert_text "Player was successfully updated"
    click_on "Back"
  end

  test "destroying a Player" do
    visit players_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Player was successfully destroyed"
  end
end
