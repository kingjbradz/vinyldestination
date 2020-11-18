class Vinyl < ApplicationRecord
    attribute :price, default: 1.0

    validates :price, :length => { :maximum => 6 }

    validates_presence_of :title, :artist, :label, :genre, :year, :quality, :price

    has_one_attached :image

    belongs_to :user
end
