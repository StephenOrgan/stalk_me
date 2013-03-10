class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :user_id
      t.string :description
      t.string :link

      t.timestamps
    end
  end
end
