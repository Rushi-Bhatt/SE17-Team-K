class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.Integer :section_id
      t.Integer :user_id
      t.Integer :num_of_exam
      t.Integer :num_of_project
      t.Integer :num_of_project
      t.Integer :num_of_assignment
      t.string :tool_and_lang
      t.Integer :fav_factor
      t.Integer :prof_rating_id
      t.Integer :job
      t.Integer :workload
      t.string :grade
      t.string :relate_course
      t.Integer :quality_of_lecture
      t.Integer :category

      t.timestamps
    end
  end
end
