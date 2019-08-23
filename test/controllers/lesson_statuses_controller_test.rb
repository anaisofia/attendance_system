require 'test_helper'

class LessonStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_status = lesson_statuses(:one)
  end

  test "should get index" do
    get lesson_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_status_url
    assert_response :success
  end

  test "should create lesson_status" do
    assert_difference('LessonStatus.count') do
      post lesson_statuses_url, params: { lesson_status: { name: @lesson_status.name } }
    end

    assert_redirected_to lesson_status_url(LessonStatus.last)
  end

  test "should show lesson_status" do
    get lesson_status_url(@lesson_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_status_url(@lesson_status)
    assert_response :success
  end

  test "should update lesson_status" do
    patch lesson_status_url(@lesson_status), params: { lesson_status: { name: @lesson_status.name } }
    assert_redirected_to lesson_status_url(@lesson_status)
  end

  test "should destroy lesson_status" do
    assert_difference('LessonStatus.count', -1) do
      delete lesson_status_url(@lesson_status)
    end

    assert_redirected_to lesson_statuses_url
  end
end
