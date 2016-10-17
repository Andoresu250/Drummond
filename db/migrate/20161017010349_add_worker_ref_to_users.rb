class AddWorkerRefToUsers < ActiveRecord::Migration
  def change
  	add_reference :users, :worker, foreign_key: true
  end
end
