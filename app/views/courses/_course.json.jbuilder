json.extract! course, :id, :name, :course_level_id, :course_status_id, :meetingDay, :start_time, :end_time, :address, :info, :created_at, :updated_at
json.url course_url(course, format: :json)
