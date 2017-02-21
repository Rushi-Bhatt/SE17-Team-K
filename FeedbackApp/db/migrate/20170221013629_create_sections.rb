class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :course_id
      t.integer :prof_id
      t.string :semester

      t.timestamps
    end
  end
end
