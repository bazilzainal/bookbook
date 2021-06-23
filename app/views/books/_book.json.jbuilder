json.extract! book, :id, :title, :author, :availability, :location, :created_at, :updated_at
json.url book_url(book, format: :json)
