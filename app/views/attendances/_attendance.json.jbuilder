json.extract! attendance, :id, :user_id, :lesson_id, :lesson_status_id, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
