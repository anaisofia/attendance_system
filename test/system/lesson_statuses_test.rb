require "application_system_test_case"

class LessonStatusesTest < ApplicationSystemTestCase
  setup do
    @lesson_status = lesson_statuses(:one)
  end

  test "visiting the index" do
    visit lesson_statuses_url
    assert_selector "h1", text: "Lesson Statuses"
  end

  test "creating a Lesson status" do
    visit lesson_statuses_url
    click_on "New Lesson Status"

    fill_in "Name", with: @lesson_status.name
    click_on "Create Lesson status"

    assert_text "Lesson status was successfully created"
    click_on "Back"
  end

  test "updating a Lesson status" do
    visit lesson_statuses_url
    click_on "Edit", match: :first

    fill_in "Name", with: @lesson_status.name
    click_on "Update Lesson status"

    assert_text "Lesson status was successfully updated"
    click_on "Back"
  end

  test "destroying a Lesson status" do
    visit lesson_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lesson status was successfully destroyed"
  end
end
