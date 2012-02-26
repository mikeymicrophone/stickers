class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :target_type
      t.integer :target_id
      t.text :note
      t.string :payload
      t.integer :member_id

      t.timestamps
    end
  end
end
