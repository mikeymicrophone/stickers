class CreateTiers < ActiveRecord::Migration
  def change
    create_table :tiers do |t|
      t.string :name
      t.text :note
      t.integer :member_id

      t.timestamps
    end
  end
end
