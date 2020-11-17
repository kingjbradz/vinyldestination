class ListingController < ApplicationController
  def page
    @vinyls = Vinyl.where(availability: true)
  end
end
