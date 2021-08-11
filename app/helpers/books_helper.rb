module BooksHelper

    def add_book_availability(book)
        @client = ::NLBSG.client(key: 'REVWLVphaW5hbDpaYWlubGIkJV4=', env: :production)
        @availability = @client.get_availability_info(BID: book.bid)

        @availability.items.each do |status|
            book_av = BookAvailability.new do |i|
                i.book_id = book.id
                i.location_code = status[:branch_id]
                i.status_code = status[:status_code]
            end
            book_av.save
        end
          
    end

    def update_book_availability(book)
        @client = ::NLBSG.client(key: 'REVWLVphaW5hbDpaYWlubGIkJV4=', env: :production)
        @availability = @client.get_availability_info(BID: book.bid)
        # button will send update request
        # Param will be set depending on button
        book.book_availabilities.destroy_all

        @availability.items.each do |status|
            book_av = BookAvailability.new do |i|
                i.book_id = book.id
                i.location_code = status[:branch_id]
                i.status_code = status[:status_code]
            end
            book_av.save
        end

    end


end
