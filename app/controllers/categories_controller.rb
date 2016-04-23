class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(name: params[:category])
    redirect_to '/errors/not_found.html' unless @category
  end
end
