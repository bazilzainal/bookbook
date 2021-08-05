class BookAvailabilitiesController < ApplicationController

    def update
        book = Book.find_by(id: params[:id])
        update_book_availability(book)
        redirect_to root_path
    end

end
