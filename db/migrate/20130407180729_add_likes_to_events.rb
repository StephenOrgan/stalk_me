class AddLikesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :likes, :integer
  end
end
