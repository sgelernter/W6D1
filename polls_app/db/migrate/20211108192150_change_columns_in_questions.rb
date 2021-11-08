class ChangeColumnsInQuestions < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :author_id, :poll_id
  end
end
