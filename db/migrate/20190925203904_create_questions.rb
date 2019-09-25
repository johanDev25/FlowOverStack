class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :name, limit: 50
      t.text :text

      t.timestamps
    end
  end
end
