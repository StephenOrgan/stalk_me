class RemoveLikesFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :likes
  end

  def down
    add_column :events, :likes, :integer
  end
end
