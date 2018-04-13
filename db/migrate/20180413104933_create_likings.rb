class CreateLikings < ActiveRecord::Migration[5.2]
  def change
    create_table :likings do |t|
      t.references :user, foreign_key: true
      t.references :likable, polymorphic: true

      t.timestamps
    end
  end
end
