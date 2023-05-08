class Article < ApplicationRecord
    paginates_per 2
    validates :title, :body, :release_date, presence:   true

    has_many :comments
end
