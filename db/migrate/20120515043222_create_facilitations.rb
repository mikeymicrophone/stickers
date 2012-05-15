class CreateFacilitations < ActiveRecord::Migration
  def change
    create_table :facilitations do |t|
      t.references :sub_club
      t.references :member

      t.timestamps
    end
    add_index :facilitations, :sub_club_id
    add_index :facilitations, :member_id
  end
end
