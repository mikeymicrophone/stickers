class CreateTierHouses < ActiveRecord::Migration
  def change
    create_table :tier_houses do |t|
      t.references :sub_club
      t.references :tier

      t.timestamps
    end
    add_index :tier_houses, :sub_club_id
    add_index :tier_houses, :tier_id
  end
end
