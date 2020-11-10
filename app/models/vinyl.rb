class Vinyl < ApplicationRecord
    attribute :price, default: 0.5

    has_one_attached :image
end
