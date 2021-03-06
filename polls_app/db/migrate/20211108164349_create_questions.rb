class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :question, null: false 
      t.integer :author_id, null: false
      t.timestamps
    end
    add_index :questions, :author_id
  end
end
