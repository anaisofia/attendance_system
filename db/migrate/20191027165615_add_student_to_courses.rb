class AddStudentToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :student, :string
  end
end
