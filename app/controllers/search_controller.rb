class SearchController < ApplicationController
    before_action :authenticate_user!, except: [:new, :result, :show]
    before_action :set_client, only: %i[ show result ]

    def new
    end

    def add
        if current_user.books.find_by(bid: params[:bid]).present?
            flash[:notice] = "Book already exists"
            redirect_to books_path
        else
            book = get_book(params[:bid])
            current_user.books<<book
            add_book_availability(book)
            flash[:notice] = "Book successfully added"
            redirect_to books_path
        end
    end

    def result
        @book = Book.new
        @response = get_response(search_params)

        @response.titles.each do |i|
            book = Book.new(book_params(i))
            book.save
        end
    end
    
    def show
        # @result = @response.titles.each.find_by(:bid)
        @details = @client.get_title_details(BID: params[:bid])
        @availability = @client.get_availability_info(BID: params[:bid])
    end
    
    private

        def book_params(title)
            h = {}
            h[:title] = title[:title_name]
            h[:author] = title[:author]
            h[:bid] = title[:bid]
            h[:isbn] = title[:isbn]
            h
        end

        def get_response(params)
            if params.length > 1
                response = @client.search(params)
            else
                redirect_to search_path, notice: "At least one field must be populated"
            end
            response
        end

        def set_client
            @client = ::NLBSG.client(key: 'REVWLVphaW5hbDpaYWlubGIkJV4=', env: :production)
        end


        def search_params
            # permits only these parameters to be passed, and removes it if it is blank
            params[:search].permit(:title, :author, :keywords, :subject).to_h.symbolize_keys.merge({ :media_code => "BK" }).delete_if {|key, value| value.blank? }
        end

        def get_book(bid)
            @book = Book.where(bid: bid).first
        end

end
