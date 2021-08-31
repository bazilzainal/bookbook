class Book < ApplicationRecord
    validates :bid, uniqueness: { message: "" }

    has_and_belongs_to_many :users
    # belongs_to :reading_list, optional: true
    has_many :book_availabilities, dependent: :destroy
end
