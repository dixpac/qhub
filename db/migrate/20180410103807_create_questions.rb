class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.references :creator, references: :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
