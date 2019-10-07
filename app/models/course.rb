class Course < ApplicationRecord
  belongs_to :course_level
  belongs_to :course_status

  has_many :lessons
  has_many :users, :through => :lessons
  has_many :lesson_statuses, :through => :lessons

  accepts_nested_attributes_for :users

  def teachers
    self.users.where(role: 2).map { |c| "#{c.first_name} #{c.last_name}"  }
  end

  def students
    self.users.where(role: 3).map { |c| "#{c.first_name} #{c.last_name}"  }
  end
end
