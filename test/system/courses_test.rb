require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @course = courses(:one)
  end

  test "visiting the index" do
    visit courses_url
    assert_selector "h1", text: "Courses"
  end

  test "creating a Course" do
    visit courses_url
    click_on "New Course"

    fill_in "Address", with: @course.address
    fill_in "Course level", with: @course.course_level_id
    fill_in "Course status", with: @course.course_status_id
    fill_in "End time", with: @course.end_time
    fill_in "Info", with: @course.info
    fill_in "Meetingday", with: @course.meetingDay
    fill_in "Name", with: @course.name
    fill_in "Start time", with: @course.start_time
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "updating a Course" do
    visit courses_url
    click_on "Edit", match: :first

    fill_in "Address", with: @course.address
    fill_in "Course level", with: @course.course_level_id
    fill_in "Course status", with: @course.course_status_id
    fill_in "End time", with: @course.end_time
    fill_in "Info", with: @course.info
    fill_in "Meetingday", with: @course.meetingDay
    fill_in "Name", with: @course.name
    fill_in "Start time", with: @course.start_time
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "destroying a Course" do
    visit courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course was successfully destroyed"
  end
end
