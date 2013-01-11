class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.string :detail
      t.string :tip

      t.timestamps
    end
  end
end
