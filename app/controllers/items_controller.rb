class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def static
  end

  def show
    @item = Item.find(params[:id])
  end
end
