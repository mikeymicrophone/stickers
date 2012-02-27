class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.text :message
      t.integer :member_id

      t.timestamps
    end
  end
end
