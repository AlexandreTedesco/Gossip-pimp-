class CreatePrivateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
