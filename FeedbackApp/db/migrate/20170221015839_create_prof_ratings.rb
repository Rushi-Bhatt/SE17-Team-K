class CreateProfRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :prof_ratings do |t|
      t.Integer :feedback_id
      t.Integer :prof_id
      t.Integer :fluency
      t.Integer :course_material
      t.Integer :knowledge
      t.Integer :helpful

      t.timestamps
    end
  end
end
