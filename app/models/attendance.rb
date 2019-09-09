class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  belongs_to :lesson_status

  # # posibilidad 
  # before_create :change_status
  #
  #
  # def change_status
  #   self.status = 0
  # end

end
