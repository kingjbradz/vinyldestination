class ListingController < ApplicationController
  def page
    @vinyls = Vinyl.all
  end
end
