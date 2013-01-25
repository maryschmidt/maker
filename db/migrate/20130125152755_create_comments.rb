class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.belongs_to :project
      t.belongs_to :user

      t.timestamps
    end
    add_index :comments, :project_id
    add_index :comments, :user_id
  end
end
