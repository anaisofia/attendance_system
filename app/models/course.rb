class Course < ApplicationRecord
  belongs_to :course_level
  belongs_to :course_status
end
