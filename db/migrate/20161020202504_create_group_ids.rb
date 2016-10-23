class CreateGroupIds < ActiveRecord::Migration
  def change
    create_table :group_ids do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
