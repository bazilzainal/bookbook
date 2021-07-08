module SearchHelper

    # Return only alphanumeric values

    def to_numeric(input)
        output = input.to_s.gsub(/[^0-9]/, "")
    end



end
