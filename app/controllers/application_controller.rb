class ApplicationController < ActionController::Base
    include BooksHelper
    
    def hello
        render html: "hello there"
    end

    
end
