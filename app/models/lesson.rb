class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :lesson_status
end
