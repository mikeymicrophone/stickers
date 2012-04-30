class CreateTierings < ActiveRecord::Migration
  def change
    create_table :tierings do |t|
      t.belongs_to :endeavor
      t.belongs_to :tier

      t.timestamps
    end
    add_index :tierings, :endeavor_id
    add_index :tierings, :tier_id
  end
end
