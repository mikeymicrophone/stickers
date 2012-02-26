class ScoresHaveDate < ActiveRecord::Migration
  def up
    add_column :scores, :date, :date
  end

  def down
    remove_column :scores, :date
  end
end
