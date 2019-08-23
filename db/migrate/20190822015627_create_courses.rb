class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.references :course_level, null: false, foreign_key: true
      t.references :course_status, null: false, foreign_key: true
      t.string :meetingDay
      t.time :start_time
      t.time :end_time
      t.string :address
      t.text :info

      t.timestamps
    end
  end
end
