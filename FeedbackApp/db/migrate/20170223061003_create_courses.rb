class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :number
      t.string :title
      t.string :level
      t.references :department, foreign_key: true
      t.references :professor, foreign_key: true
      t.timestamps
    end
  end
end
