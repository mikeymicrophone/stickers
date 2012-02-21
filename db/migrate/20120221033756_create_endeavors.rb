class CreateEndeavors < ActiveRecord::Migration
  def change
    create_table :endeavors do |t|
      t.belongs_to :goal
      t.belongs_to :member

      t.timestamps
    end
    add_index :endeavors, :goal_id
    add_index :endeavors, :member_id
  end
end
