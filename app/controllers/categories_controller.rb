class CategoriesController < ApplicationController
  require 'inventory_api'
  
  def index
    @categories = InventoryApi.get_all("categories")
  end

  def new
  end

  def create
    response = InventoryApi.post_to_server('categories',category_params)
    if response["errors"].nil?
      redirect_to categories_path 
    else
      error = (response["errors"].keys+response["errors"].values).join(" ")
      redirect_to :back, :notice => error
    end
  end

private

  def category_params
    params.require(:category).permit(:id, :name, :description)
  end
end
