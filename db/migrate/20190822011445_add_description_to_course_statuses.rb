class AddDescriptionToCourseStatuses < ActiveRecord::Migration[6.0]
  def change
    add_column :course_statuses, :description, :text
  end
end
