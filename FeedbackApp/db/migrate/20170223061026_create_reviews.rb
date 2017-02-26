class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
