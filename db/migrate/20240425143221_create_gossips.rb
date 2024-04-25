class CreateGossips < ActiveRecord::Migration[7.1]
  def change
    create_table :gossips do |t|
      t.string :title
      t.text :content
      t.date :publication_date
      t.integer :like_count, default: 0
      t.belongs_to :user, index: true
      t.belongs_to :city, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
