class CartItemsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    flash[:notice] = "Successfully added to cart!"
    session[:cart] = @cart.contents
    redirect_to items_path
  end

  def index
    cart = session[:cart]
    @cart_contents = cart.map { |id,quantity| [Item.find(id.to_i), quantity] }
    
    # byebug

  end

end
