class PagesController < ApplicationController

  def splash
    @disable_nav = true
    @sample = Item.all.sample(3)
  end

end
