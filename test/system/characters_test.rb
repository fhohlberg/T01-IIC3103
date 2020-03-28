require "application_system_test_case"

class CharactersTest < ApplicationSystemTestCase
  setup do
    @character = characters(:one)
  end

  test "visiting the index" do
    visit characters_url
    assert_selector "h1", text: "Characters"
  end

  test "creating a Character" do
    visit characters_url
    click_on "New Character"

    fill_in "Created", with: @character.created
    fill_in "Episode", with: @character.episode
    fill_in "Gender", with: @character.gender
    fill_in "Image", with: @character.image
    fill_in "Location", with: @character.location
    fill_in "Name", with: @character.name
    fill_in "Origin", with: @character.origin
    fill_in "Species", with: @character.species
    fill_in "Status", with: @character.status
    fill_in "Type", with: @character.type
    fill_in "Url", with: @character.url
    click_on "Create Character"

    assert_text "Character was successfully created"
    click_on "Back"
  end

  test "updating a Character" do
    visit characters_url
    click_on "Edit", match: :first

    fill_in "Created", with: @character.created
    fill_in "Episode", with: @character.episode
    fill_in "Gender", with: @character.gender
    fill_in "Image", with: @character.image
    fill_in "Location", with: @character.location
    fill_in "Name", with: @character.name
    fill_in "Origin", with: @character.origin
    fill_in "Species", with: @character.species
    fill_in "Status", with: @character.status
    fill_in "Type", with: @character.type
    fill_in "Url", with: @character.url
    click_on "Update Character"

    assert_text "Character was successfully updated"
    click_on "Back"
  end

  test "destroying a Character" do
    visit characters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Character was successfully destroyed"
  end
end
