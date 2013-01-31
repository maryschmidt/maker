class AddStatusToGoals < ActiveRecord::Migration
  def change
    change_table :goals do |t|
      t.boolean :remind_me, default: false
      t.string :frequency
      t.boolean :status, default: false
    end
  end
end
