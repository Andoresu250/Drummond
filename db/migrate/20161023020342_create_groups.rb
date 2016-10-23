class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|

      t.references :group_id, index: true, foreign_key: true
      t.boolean :current, default: true

      t.timestamps null: false
    end
  end
end
