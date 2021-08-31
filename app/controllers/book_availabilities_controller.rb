class BookAvailabilitiesController < ApplicationController

    def update
        book = Book.find_by(id: params[:id])
        update_book_availability(book)
        # Show notice of update
        flash[:notice] = 'Successfully updated'
        # Redirect to main books page
        redirect_to books_path
    end

end
