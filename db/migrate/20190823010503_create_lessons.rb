class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.date :date
      t.string :subject
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.references :lesson_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
