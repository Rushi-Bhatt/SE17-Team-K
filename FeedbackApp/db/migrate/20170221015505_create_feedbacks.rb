class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.integer :section_id
      t.integer :user_id
      t.integer :num_of_exam
      t.integer :num_of_project
      t.integer :num_of_project
      t.integer :num_of_assignment
      t.string :tool_and_lang
      t.integer :fav_factor
      t.integer :prof_rating_id
      t.integer :job
      t.integer :workload
      t.string :grade
      t.string :relate_course
      t.integer :quality_of_lecture
      t.integer :category

      t.timestamps
    end
  end
end
