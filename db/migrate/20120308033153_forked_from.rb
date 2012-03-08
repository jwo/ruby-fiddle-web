class ForkedFrom < ActiveRecord::Migration
  def up
    add_column :riddles, :forked_from_id, :integer
  end

  def down
    remove_column :riddles, :forked_from_id
  end
end
