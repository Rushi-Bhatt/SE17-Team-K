class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :review_id
      t.integer :like
      t.integer :dislike

      t.timestamps
    end
  end
end
