class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :liker, references: :user, null: false, index: true
      t.references :likeable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
