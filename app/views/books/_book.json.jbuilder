json.extract! book, :id, :title, :author, :availability, :location, :reading_list_id, :user_id, :created_at, :updated_at
json.url book_url(book, format: :json)
