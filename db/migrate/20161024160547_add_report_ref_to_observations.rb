class AddReportRefToObservations < ActiveRecord::Migration
  def change
    add_reference :observations, :report, index: true, foreign_key: true
  end
end
