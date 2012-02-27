class CreateInvitees < ActiveRecord::Migration
  def change
    create_table :invitees do |t|
      t.string :email
      t.integer :facebook_id
      t.integer :invite_id
      t.integer :member_id
      t.string :confirmation_token

      t.timestamps
    end
  end
end
