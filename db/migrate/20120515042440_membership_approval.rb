class MembershipApproval < ActiveRecord::Migration
  def up
    add_column :memberships, :approved, :boolean
    add_column :tier_houses, :approved, :boolean
  end

  def down
    remove_column :memberships, :approved
    remove_column :tier_hosues, :approved
  end
end
