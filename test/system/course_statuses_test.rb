require "application_system_test_case"

class CourseStatusesTest < ApplicationSystemTestCase
  setup do
    @course_status = course_statuses(:one)
  end

  test "visiting the index" do
    visit course_statuses_url
    assert_selector "h1", text: "Course Statuses"
  end

  test "creating a Course status" do
    visit course_statuses_url
    click_on "New Course Status"

    fill_in "Name", with: @course_status.name
    click_on "Create Course status"

    assert_text "Course status was successfully created"
    click_on "Back"
  end

  test "updating a Course status" do
    visit course_statuses_url
    click_on "Edit", match: :first

    fill_in "Name", with: @course_status.name
    click_on "Update Course status"

    assert_text "Course status was successfully updated"
    click_on "Back"
  end

  test "destroying a Course status" do
    visit course_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course status was successfully destroyed"
  end
end
