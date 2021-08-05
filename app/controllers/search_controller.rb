class SearchController < ApplicationController
    # before_action :authenticate_user!, except: [:new, :result]
    before_action :set_client, only: %i[ show result ]

    def new
    end

    def result
        @book = Book.new
        
        
        if search_params.length > 1 # Default is 1 because :media_code is added in by the search_params private method
            @response = @client.search(search_params)
        else
            redirect_to search_path, notice: "At least one field must be populated"
        end
    end
    
    def show
        # @result = @response.titles.each.find_by(:bid)
        @details = @client.get_title_details(BID: params[:bid])
        @availability = @client.get_availability_info(BID: params[:bid])
    end
    
    private
        def set_client
            @client = ::NLBSG.client(key: 'REVWLVphaW5hbDpaYWlubGIkJV4=', env: :production)
        end


        def search_params
            # permits only these parameters to be passed, and removes it if it is blank
            params[:search].permit(:title, :author, :keywords, :subject).to_h.symbolize_keys.merge({ :media_code => "BK" }).delete_if {|key, value| value.blank? }
        end
end
