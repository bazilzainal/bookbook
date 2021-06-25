class Book < ApplicationRecord
    belongs_to :reading_list, optional: true
end
