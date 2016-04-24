class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
    redirect_to '/errors/not_found.html' unless @item
  end

end
