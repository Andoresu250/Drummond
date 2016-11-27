class AddMainProblemToObservations < ActiveRecord::Migration
  def change
    add_column :observations, :main_problem, :string
    add_column :observations, :cause, :string
  end
end
