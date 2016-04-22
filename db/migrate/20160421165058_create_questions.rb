class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :body
      t.integer :user_id

      t.timestamp
    end
  end
end
