class AddCodeToWorkers < ActiveRecord::Migration
  def change
  	add_column :workers, :code, :string
  end
end
