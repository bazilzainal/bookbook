class ApplicationController < ActionController::Base
    
    def hello
        render html: "hello there"
    end

    
end
