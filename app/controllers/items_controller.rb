class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def static

  end
end
