class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      #t.string :like, :likeable_type
      #t.integer :like_i, :likeable_id
      t.timestamps
    end
  end
end
