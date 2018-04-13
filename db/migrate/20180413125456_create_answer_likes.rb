class CreateAnswerLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :creator, references: :user, null: false
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
