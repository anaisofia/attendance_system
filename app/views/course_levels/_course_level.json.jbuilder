json.extract! course_level, :id, :code, :name, :description, :created_at, :updated_at
json.url course_level_url(course_level, format: :json)
