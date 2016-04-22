class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :votable_id
      t.string :votable_type
      t.string :type

      t.timestamps
    end

    add_index :votes, :votable_id
  end
end
