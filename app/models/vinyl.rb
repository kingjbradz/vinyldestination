class Vinyl < ApplicationRecord
    attribute :price, default: 1.0

    validates_presence_of :title, :artist, :label, :genre, :year, :quality, :price

    has_one_attached :image
end
