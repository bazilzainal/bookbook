class SearchController < ApplicationController
    before_action :authenticate_user!, except: [:new, :result]

    def new
    end

    def result
        @book = Book.new
        apikey = 'REVWLVphaW5hbDpaYWlubGIkJV4='
        @client = ::NLBSG.client(key: 'REVWLVphaW5hbDpaYWlubGIkJV4=', env: :production)
        @response = @client.search(title: params[:search][:query])
    end

end
