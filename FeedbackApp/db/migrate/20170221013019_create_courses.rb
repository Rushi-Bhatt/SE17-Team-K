class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :level
      t.string :dept_id
      t.string :course_id
      t.timestamps
    end
  end
end
