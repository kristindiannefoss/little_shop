class PagesController < ApplicationController

  def splash
    @sample = Item.all.sample(3)
  end

end
