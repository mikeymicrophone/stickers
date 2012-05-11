class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :sub_club
      t.references :member

      t.timestamps
    end
    add_index :memberships, :sub_club_id
    add_index :memberships, :member_id
  end
end
