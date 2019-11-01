class AddTeacherToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :teacher, :string
  end
end
