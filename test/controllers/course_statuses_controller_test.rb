require 'test_helper'

class CourseStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_status = course_statuses(:one)
  end

  test "should get index" do
    get course_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_course_status_url
    assert_response :success
  end

  test "should create course_status" do
    assert_difference('CourseStatus.count') do
      post course_statuses_url, params: { course_status: { name: @course_status.name } }
    end

    assert_redirected_to course_status_url(CourseStatus.last)
  end

  test "should show course_status" do
    get course_status_url(@course_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_status_url(@course_status)
    assert_response :success
  end

  test "should update course_status" do
    patch course_status_url(@course_status), params: { course_status: { name: @course_status.name } }
    assert_redirected_to course_status_url(@course_status)
  end

  test "should destroy course_status" do
    assert_difference('CourseStatus.count', -1) do
      delete course_status_url(@course_status)
    end

    assert_redirected_to course_statuses_url
  end
end
