require "application_system_test_case"

class PetsnamesTest < ApplicationSystemTestCase
  setup do
    @petsname = petsnames(:one)
  end

  test "visiting the index" do
    visit petsnames_url
    assert_selector "h1", text: "Petsnames"
  end

  test "creating a Petsname" do
    visit petsnames_url
    click_on "New Petsname"

    fill_in "Birthday", with: @petsname.birthday
    fill_in "Race", with: @petsname.race
    click_on "Create Petsname"

    assert_text "Petsname was successfully created"
    click_on "Back"
  end

  test "updating a Petsname" do
    visit petsnames_url
    click_on "Edit", match: :first

    fill_in "Birthday", with: @petsname.birthday
    fill_in "Race", with: @petsname.race
    click_on "Update Petsname"

    assert_text "Petsname was successfully updated"
    click_on "Back"
  end

  test "destroying a Petsname" do
    visit petsnames_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Petsname was successfully destroyed"
  end
end
