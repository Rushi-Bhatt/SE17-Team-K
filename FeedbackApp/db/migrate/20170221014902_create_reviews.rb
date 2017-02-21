class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.Integer :section_id
      t.Integer :user_id
      t.text :review
      t.Integer :like
      t.Integer :dislike

      t.timestamps
    end
  end
end
