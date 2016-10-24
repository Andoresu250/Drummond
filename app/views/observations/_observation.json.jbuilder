json.extract! observation, :id, :equipment_id, :down, :ready, :created_at, :updated_at
json.url observation_url(observation, format: :json)