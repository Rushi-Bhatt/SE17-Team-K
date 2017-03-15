class CreateProfRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :prof_ratings do |t|
      t.integer :professor_id
      t.integer :fluency
      t.integer :course_material
      t.integer :knowledge
      t.integer :doubt_solving
      t.timestamps
    end
  end
end
