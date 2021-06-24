json.extract! reading_list, :id, :name, :user_id, :created_at, :updated_at
json.url reading_list_url(reading_list, format: :json)
