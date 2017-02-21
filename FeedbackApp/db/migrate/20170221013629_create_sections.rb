class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :course_id
      t.string :Integer
      t.Integer :prof_id
      t.string :semester

      t.timestamps
    end
  end
end
