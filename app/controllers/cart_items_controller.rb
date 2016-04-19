class CartItemsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    flash[:notice] = "Successfully added to cart!"
    session[:cart] = @cart.contents
    redirect_to items_path
  end

  def index
    @items = @cart.contents.map do |id, quantity|
      [Item.find(id.to_i), quantity]
    end
  end

  def destroy
    item = Item.find(params[:id])
    @cart.contents.delete(params[:id])
    flash[:notice] = "Successfully removed <a href=\"/items/#{item.id}\">#{item.name}</a>!"
    redirect_to cart_path
  end

end
