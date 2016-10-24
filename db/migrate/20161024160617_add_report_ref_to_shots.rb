class AddReportRefToShots < ActiveRecord::Migration
  def change
    add_reference :shots, :report, index: true, foreign_key: true
  end
end
