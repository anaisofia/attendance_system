class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :lesson_status

  has_many :attendances

  def start
    date
  end

# para usarlo con json
  def editable?
    Date.today < start ? true : false
  end
end
