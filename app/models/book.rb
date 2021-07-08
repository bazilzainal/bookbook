class Book < ApplicationRecord
    belongs_to :reading_list, optional: true
    belongs_to :user, optional: true
end
