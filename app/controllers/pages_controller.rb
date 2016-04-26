class PagesController < ApplicationController

  def splash
    @disable_nav = true
    @sample = Page.new.get_popular_products
  end
end
