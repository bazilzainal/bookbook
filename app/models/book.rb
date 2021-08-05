class Book < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :reading_list, optional: true
    has_many :book_availabilities, dependent: :destroy
end
