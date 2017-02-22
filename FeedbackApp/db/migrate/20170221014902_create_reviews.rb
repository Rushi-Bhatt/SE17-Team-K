class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :section_id
      t.references :user, foreign_key: true
      t.text :review
      t.integer :like
      t.integer :dislike

      t.timestamps
    end
  end
end
