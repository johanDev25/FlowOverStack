class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :votable, polymorphic: true, null: false
      t.references :user, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
