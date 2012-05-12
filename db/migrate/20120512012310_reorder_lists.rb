class ReorderLists < ActiveRecord::Migration
  def up
    add_column :tierings, :position, :integer
    add_column :tiers, :position, :integer
    add_column :memberships, :position, :integer
    add_column :endeavors, :position, :integer
    add_column :details, :position, :integer
    add_column :tier_houses, :position, :integer
  end

  def down
    remove_column :tierings, :position
    remove_column :tiers, :position
    remove_column :memberships, :position
    remove_column :endeavors, :position
    remove_column :details, :position
    remove_column :tier_houses, :position
  end
end
