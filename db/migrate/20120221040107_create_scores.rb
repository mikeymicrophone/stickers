class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.belongs_to :endeavor
      t.belongs_to :day
      t.integer :mark

      t.timestamps
    end
    add_index :scores, :endeavor_id
    add_index :scores, :day_id
  end
end
