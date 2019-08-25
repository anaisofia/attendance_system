class Lesson < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :course
  belongs_to :lesson_status
end
