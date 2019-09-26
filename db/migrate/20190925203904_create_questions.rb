class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :name, limit: 50
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
