json.extract! report, :id, :shift, :date, :group_id, :created_at, :updated_at
json.url report_url(report, format: :json)