class AddStatusToWorkers < ActiveRecord::Migration
  def change
    add_column :workers, :status, :string, default: "trabajando"
  end
end
