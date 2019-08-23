json.extract! lesson, :id, :date, :subject, :description, :user_id, :course_id, :lesson_status_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
