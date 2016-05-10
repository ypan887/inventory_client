class CategoriesController < ApplicationController
  require 'inventory_api'
  
  def index
    @categories = InventoryApi.get_all("categories")
  end

  def new
  end

  def create
    response = InventoryApi.post_to_server('categories', category_params)
    if response["errors"].nil?
      redirect_to categories_path 
    else
      error = response["errors"]
      redirect_to :back, :alert => error
    end
  end

  def edit
    @current_category = InventoryApi.get_one("categories", params[:id])
  end

  def update
    response = InventoryApi.patch_to_server('categories', category_params)
    if response["errors"].nil?
      redirect_to categories_path
    else
      error = response["errors"]
      redirect_to :back, :alert => error
    end
  end

  def destroy
    response = InventoryApi.delete_to_server('categories', params)
    redirect_to categories_path, notice: "Successfully delete category"
  end

private

  def category_params
    params.require(:category).permit(:id, :name, :description)
  end
end
