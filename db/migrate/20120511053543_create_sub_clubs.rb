class CreateSubClubs < ActiveRecord::Migration
  def change
    create_table :sub_clubs do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
